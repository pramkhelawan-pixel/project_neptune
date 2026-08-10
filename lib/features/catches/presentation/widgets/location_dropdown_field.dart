import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../fishing_spots/domain/entities/fishing_spot.dart';
import '../../../fishing_spots/presentation/providers/fishing_spot_repository_provider.dart';
import '../../../profile/presentation/providers/profile_repository_provider.dart';

/// Sentinel value — never matches a real [FishingSpot.id], and (headers
/// only) filtered out entirely once the user searches.
const _otherValue = '__location_dropdown_other__';

/// Resolved result from [LocationDropdownField]. A catalog pick sets both
/// fields; a free-text "Other" location has no real spot to link to, so
/// only [locationName] is set.
class LocationSelection {
  const LocationSelection({
    this.fishingSpotId,
    required this.locationName,
  });

  final String? fishingSpotId;
  final String locationName;
}

List<DropdownMenuEntry<String>> _buildEntries(
  BuildContext context,
  List<FishingSpot> spots,
) {
  final provinceHeaderStyle = MenuItemButton.styleFrom(
    textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.primary,
    ),
  );
  final regionHeaderStyle = MenuItemButton.styleFrom(
    textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
      fontStyle: FontStyle.italic,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    ),
  );

  final byProvince = <String, Map<String, List<FishingSpot>>>{};
  for (final spot in spots) {
    final byRegion = byProvince.putIfAbsent(spot.province, () => {});
    byRegion.putIfAbsent(spot.region, () => []).add(spot);
  }

  final provinces = byProvince.keys.toList()..sort();

  final entries = <DropdownMenuEntry<String>>[];

  for (final province in provinces) {
    entries.add(
      DropdownMenuEntry(
        value: '__location_dropdown_province_$province',
        label: province,
        enabled: false,
        style: provinceHeaderStyle,
      ),
    );

    final regionsInProvince = byProvince[province]!;
    final regions = regionsInProvince.keys.toList()..sort();

    for (final region in regions) {
      entries.add(
        DropdownMenuEntry(
          value: '__location_dropdown_region_${province}_$region',
          label: region,
          enabled: false,
          style: regionHeaderStyle,
        ),
      );

      final spotsInRegion = [...regionsInProvince[region]!]
        ..sort((a, b) => a.name.compareTo(b.name));

      entries.addAll(
        spotsInRegion.map(
          (spot) => DropdownMenuEntry(
            value: spot.id,
            label: spot.name,
            leadingIcon: const Icon(Icons.place_outlined),
          ),
        ),
      );
    }
  }

  entries.add(
    const DropdownMenuEntry(
      value: _otherValue,
      label: 'Other (type manually)',
      leadingIcon: Icon(Icons.edit_outlined),
    ),
  );

  return entries;
}

/// Location picker backed by Neptune's fishing spot directory, grouped
/// province -> region -> spot (two tiers of disabled header rows, same
/// mechanism [SpeciesDropdownField] uses for its Edible/Non-Edible split).
///
/// The directory is premium-gated by RLS, so this widget checks
/// [currentProfileProvider] before rendering the dropdown at all: signed-out
/// or not-premium users see an inline upgrade prompt instead of a silently
/// empty list.
///
/// Selecting a catalog spot resolves both the spot's id (the live
/// `fishing_spots` FK target) and its name. "Other" free text has no
/// directory id to link to, so only a name comes back.
class LocationDropdownField extends ConsumerStatefulWidget {
  const LocationDropdownField({
    super.key,
    required this.onChanged,
    this.initialFishingSpotId,
  });

  /// Fires with the resolved selection, or null if nothing valid is
  /// selected/typed yet.
  final ValueChanged<LocationSelection?> onChanged;
  final String? initialFishingSpotId;

  @override
  ConsumerState<LocationDropdownField> createState() =>
      _LocationDropdownFieldState();
}

class _LocationDropdownFieldState
    extends ConsumerState<LocationDropdownField> {
  late String? _dropdownValue = widget.initialFishingSpotId;
  final _otherController = TextEditingController();
  List<FishingSpot> _spots = const [];

  bool get _isOther => _dropdownValue == _otherValue;

  @override
  void dispose() {
    _otherController.dispose();
    super.dispose();
  }

  void _notifyResolvedValue() {
    if (_isOther) {
      final typed = _otherController.text.trim();
      widget.onChanged(
        typed.isEmpty ? null : LocationSelection(locationName: typed),
      );
      return;
    }

    final spotId = _dropdownValue;
    if (spotId == null) {
      widget.onChanged(null);
      return;
    }

    FishingSpot? spot;
    for (final candidate in _spots) {
      if (candidate.id == spotId) {
        spot = candidate;
        break;
      }
    }

    if (spot == null) {
      widget.onChanged(null);
      return;
    }

    widget.onChanged(
      LocationSelection(fishingSpotId: spot.id, locationName: spot.name),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(currentProfileProvider);

    return profileAsync.when(
      loading: () => const _PendingField(),
      error: (error, stackTrace) => const _MessageField(
        icon: Icons.error_outline,
        message: 'Could not check your account. Please try again.',
      ),
      data: (profile) {
        if (profile == null || !profile.isPremium) {
          return const _MessageField(
            icon: Icons.workspace_premium_outlined,
            message:
                'Upgrade to premium to pick from the fishing spot directory.',
          );
        }

        return _buildSpotDropdown(context);
      },
    );
  }

  Widget _buildSpotDropdown(BuildContext context) {
    final spotsAsync = ref.watch(fishingSpotsProvider);

    return spotsAsync.when(
      loading: () => const _PendingField(),
      error: (error, stackTrace) => const _MessageField(
        icon: Icons.error_outline,
        message: 'Could not load the fishing spot directory.',
      ),
      data: (spots) {
        _spots = spots;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownMenuFormField<String>(
              initialSelection: _dropdownValue,
              onSelected: (value) {
                setState(() {
                  _dropdownValue = value;
                });
                _notifyResolvedValue();
              },
              label: const Text('Location'),
              expandedInsets: EdgeInsets.zero,
              menuHeight: MediaQuery.sizeOf(context).height * 0.5,
              enableFilter: true,
              filterCallback: (entries, filter) {
                if (filter.isEmpty) {
                  return entries;
                }

                final query = filter.toLowerCase();

                final matches = entries
                    .where(
                      (entry) =>
                          entry.enabled &&
                          entry.value != _otherValue &&
                          entry.label.toLowerCase().contains(query),
                    )
                    .toList();

                final otherEntry = entries.firstWhere(
                  (entry) => entry.value == _otherValue,
                );

                return [...matches, otherEntry];
              },
              dropdownMenuEntries: _buildEntries(context, spots),
              validator: (value) {
                if (value == null) {
                  return 'Please select a location.';
                }
                return null;
              },
            ),
            if (_isOther) ...[
              const SizedBox(height: 16),
              TextFormField(
                controller: _otherController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Location name',
                  hintText: 'Type the location name',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please type the location name.';
                  }
                  return null;
                },
                onChanged: (_) => _notifyResolvedValue(),
              ),
            ],
          ],
        );
      },
    );
  }
}

class _PendingField extends StatelessWidget {
  const _PendingField();

  @override
  Widget build(BuildContext context) {
    return const InputDecorator(
      decoration: InputDecoration(labelText: 'Location'),
      child: SizedBox(
        height: 20,
        child: LinearProgressIndicator(),
      ),
    );
  }
}

class _MessageField extends StatelessWidget {
  const _MessageField({
    required this.icon,
    required this.message,
  });

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          Icon(icon, color: colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
