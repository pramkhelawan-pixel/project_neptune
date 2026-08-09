import 'package:flutter/material.dart';

import '../../../species/data/all_species_profiles.dart';
import '../../../species/domain/species.dart';

/// Sentinel values — never match a real [Species.name], and (headers only)
/// filtered out entirely once the user searches.
const _edibleHeaderValue = '__species_dropdown_header_edible__';
const _nonEdibleHeaderValue = '__species_dropdown_header_non_edible__';
const _otherValue = '__species_dropdown_other__';

List<DropdownMenuEntry<String>> _buildEntries(BuildContext context) {
  final headerStyle = MenuItemButton.styleFrom(
    textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.primary,
    ),
  );

  List<Species> sortedByName(List<Species> species) {
    final copy = [...species];
    copy.sort((a, b) => a.name.compareTo(b.name));
    return copy;
  }

  DropdownMenuEntry<String> speciesEntry(Species species) {
    return DropdownMenuEntry(
      value: species.name,
      label: species.name,
      leadingIcon: Icon(
        species.isEdible ? Icons.set_meal : Icons.phishing,
      ),
    );
  }

  return [
    DropdownMenuEntry(
      value: _edibleHeaderValue,
      label: 'Edible',
      enabled: false,
      style: headerStyle,
    ),
    ...sortedByName(allSpeciesProfiles).map(speciesEntry),
    DropdownMenuEntry(
      value: _nonEdibleHeaderValue,
      label: 'Non-Edible',
      enabled: false,
      style: headerStyle,
    ),
    ...sortedByName(nonEdibleSpeciesProfiles).map(speciesEntry),
    const DropdownMenuEntry(
      value: _otherValue,
      label: 'Other (type manually)',
      leadingIcon: Icon(Icons.edit_outlined),
    ),
  ];
}

/// Species picker for the Log Catch form, backed by Neptune's species
/// catalog (the same 13 edible + 8 non-edible list as the Species tab)
/// instead of free text — guarantees the saved name exact-matches
/// [Species.name] / `KnowledgeRecord.species` for downstream lookups.
///
/// Browsing shows the full Edible/Non-Edible grouping; typing a search
/// term drops the (unselectable) headers and filters species names, but
/// "Other" always stays visible so an off-list species is never a dead end.
/// Selecting "Other" reveals a free-text field below — a manually-typed
/// species won't have knowledge-base recommendations, which is expected,
/// not a bug (see feedback_species_name_consistency).
class SpeciesDropdownField extends StatefulWidget {
  const SpeciesDropdownField({
    super.key,
    required this.onChanged,
    this.initialSelection,
  });

  /// Fires with the resolved species name: a canonical species, the typed
  /// "Other" text (trimmed), or null if nothing valid is selected/typed yet.
  final ValueChanged<String?> onChanged;
  final String? initialSelection;

  @override
  State<SpeciesDropdownField> createState() => _SpeciesDropdownFieldState();
}

class _SpeciesDropdownFieldState extends State<SpeciesDropdownField> {
  late String? _dropdownValue = widget.initialSelection;
  final _otherController = TextEditingController();

  bool get _isOther => _dropdownValue == _otherValue;

  @override
  void dispose() {
    _otherController.dispose();
    super.dispose();
  }

  void _notifyResolvedValue() {
    if (_isOther) {
      final typed = _otherController.text.trim();
      widget.onChanged(typed.isEmpty ? null : typed);
    } else {
      widget.onChanged(_dropdownValue);
    }
  }

  @override
  Widget build(BuildContext context) {
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
          label: const Text('Species'),
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
          dropdownMenuEntries: _buildEntries(context),
          validator: (value) {
            if (value == null) {
              return 'Please select a species.';
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
              labelText: 'Species name',
              hintText: 'Type the species name',
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please type the species name.';
              }
              return null;
            },
            onChanged: (_) => _notifyResolvedValue(),
          ),
        ],
      ],
    );
  }
}
