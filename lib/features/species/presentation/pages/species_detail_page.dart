import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/pelav_colors.dart';
import '../../../knowledge/domain/entities/knowledge_record.dart';
import '../../../knowledge/domain/enums/knowledge_category.dart';
import '../../domain/species.dart';
import '../providers/species_knowledge_provider.dart';

class SpeciesDetailPage extends ConsumerWidget {
  final Species species;

  const SpeciesDetailPage({
    super.key,
    required this.species,
  });

  static const List<KnowledgeCategory> _overviewCategories = [
    KnowledgeCategory.identity,
    KnowledgeCategory.taxonomy,
    KnowledgeCategory.biology,
    KnowledgeCategory.habitat,
    KnowledgeCategory.behaviour,
    KnowledgeCategory.feeding,
    KnowledgeCategory.seasonality,
  ];

  static const List<KnowledgeCategory> _tackleCategories = [
    KnowledgeCategory.bait,
    KnowledgeCategory.hook,
    KnowledgeCategory.leader,
    KnowledgeCategory.trace,
    KnowledgeCategory.sinker,
    KnowledgeCategory.presentation,
  ];

  static const List<KnowledgeCategory> _tipCategories = [
    KnowledgeCategory.technique,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final knowledgeAsync = ref.watch(
      speciesKnowledgeProvider(species.name),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(species.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _HeaderCard(species: species),

          const SizedBox(height: 16),

          _ProfileCard(species: species),

          const SizedBox(height: 16),

          _TackleCard(species: species),

          const SizedBox(height: 16),

          if (species.notes.isNotEmpty || species.feedingBehaviour.isNotEmpty)
            _NotesCard(species: species),

          const SizedBox(height: 16),

          knowledgeAsync.when(
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stackTrace) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text('Unable to load knowledge.\n\n$error'),
            ),
            data: (records) => _KnowledgeSections(records: records),
          ),
        ],
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  final Species species;

  const _HeaderCard({required this.species});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              species.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              species.scientificName,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            if (species.aliases.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                'Also known as: ${species.aliases.join(', ')}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            if (species.habitats.isNotEmpty ||
                species.distribution.isNotEmpty) ...[
              const SizedBox(height: 14),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ...species.habitats.map(
                        (habitat) => Chip(label: Text(habitat)),
                  ),
                  ...species.distribution.map(
                        (region) => Chip(
                      label: Text(region),
                      backgroundColor: context.colors.goldWash,
                      side: BorderSide(color: context.colors.hairline),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final Species species;

  const _ProfileCard({required this.species});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Conditions',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.access_time,
              label: 'Best Time',
              value: species.preferredTime,
            ),
            _InfoRow(
              icon: Icons.waves,
              label: 'Preferred Tides',
              value: species.preferredTides.join(', '),
            ),
            _InfoRow(
              icon: Icons.air,
              label: 'Preferred Wind',
              value:
              '${species.preferredWindDirections.join(', ')} · ${species.minWindSpeed.toStringAsFixed(0)}-${species.maxWindSpeed.toStringAsFixed(0)} km/h',
            ),
            _InfoRow(
              icon: Icons.tsunami,
              label: 'Preferred Swell',
              value:
              '${species.minSwellHeight}m - ${species.maxSwellHeight}m',
            ),
            _InfoRow(
              icon: Icons.dark_mode,
              label: 'Preferred Moon',
              value: species.preferredMoonPhases.join(', '),
            ),
            if (species.preferredWaterTemperature.isNotEmpty)
              _InfoRow(
                icon: Icons.thermostat,
                label: 'Water Temperature',
                value: species.preferredWaterTemperature,
              ),
            if (species.preferredWaterColour.isNotEmpty)
              _InfoRow(
                icon: Icons.water_drop,
                label: 'Water Colour',
                value: species.preferredWaterColour,
              ),
            if (species.seasons.isNotEmpty)
              _InfoRow(
                icon: Icons.calendar_today,
                label: 'Seasons',
                value: species.seasons.join(', '),
              ),
          ],
        ),
      ),
    );
  }
}

class _TackleCard extends StatelessWidget {
  final Species species;

  const _TackleCard({required this.species});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tackle',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.set_meal,
              label: 'Recommended Bait',
              value: species.recommendedBait,
            ),
            _InfoRow(
              icon: Icons.phishing,
              label: 'Recommended Lure',
              value: species.recommendedLure,
            ),
            if (species.recommendedTrace.isNotEmpty)
              _InfoRow(
                icon: Icons.link,
                label: 'Recommended Trace',
                value: species.recommendedTrace,
              ),
            if (species.recommendedHookSizes.isNotEmpty)
              _InfoRow(
                icon: Icons.hardware,
                label: 'Hook Sizes',
                value: species.recommendedHookSizes.join(', '),
              ),
          ],
        ),
      ),
    );
  }
}

class _NotesCard extends StatelessWidget {
  final Species species;

  const _NotesCard({required this.species});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notes',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            if (species.feedingBehaviour.isNotEmpty) ...[
              Text(species.feedingBehaviour),
              const SizedBox(height: 10),
            ],
            if (species.notes.isNotEmpty) Text(species.notes),
          ],
        ),
      ),
    );
  }
}

class _KnowledgeSections extends StatelessWidget {
  final List<KnowledgeRecord> records;

  const _KnowledgeSections({required this.records});

  @override
  Widget build(BuildContext context) {
    final overview = records
        .where((r) => SpeciesDetailPage._overviewCategories.contains(r.category))
        .toList();

    final tackle = records
        .where((r) => SpeciesDetailPage._tackleCategories.contains(r.category))
        .toList();

    final tips = records
        .where((r) => SpeciesDetailPage._tipCategories.contains(r.category))
        .toList();

    final regulatory = records
        .where((r) => r.category == KnowledgeCategory.conservation)
        .toList();

    final other = records
        .where(
          (r) =>
      !overview.contains(r) &&
          !tackle.contains(r) &&
          !tips.contains(r) &&
          !regulatory.contains(r),
    )
        .toList();

    if (records.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Text('No knowledge records available yet for this species.'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (regulatory.isNotEmpty)
          _RegulatoryNoticeSection(records: regulatory),
        if (overview.isNotEmpty)
          _KnowledgeSection(title: 'Species Knowledge', records: overview),
        if (tackle.isNotEmpty)
          _KnowledgeSection(title: 'Bait & Tackle Knowledge', records: tackle),
        if (tips.isNotEmpty)
          _KnowledgeSection(title: 'Expert Tips', records: tips),
        if (other.isNotEmpty)
          _KnowledgeSection(title: 'Other Knowledge', records: other),
      ],
    );
  }
}

class _RegulatoryNoticeSection extends StatelessWidget {
  final List<KnowledgeRecord> records;

  const _RegulatoryNoticeSection({required this.records});

  @override
  Widget build(BuildContext context) {
    // Was Colors.amber.shade800/900/50 -- the original app_colors.dart
    // comment documented that warning/warningStrong were deliberately held
    // identical to this exact amber800/900 pairing. PELAV's warning tokens
    // now use different hex values, so the raw Material shades are
    // migrated to the semantic tokens directly rather than left
    // hardcoded. The pale-background text below intentionally uses
    // paleChipText (dark navy), not warningStrong -- warningStrong on
    // paleWarningBg fails WCAG AA outright in both themes (see
    // app_colors.dart / app_colors_light.dart); paleChipText on the same
    // background measures >12:1 in both.
    final colors = context.colors;
    final accent = colors.warning;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: accent, size: 22),
              const SizedBox(width: 8),
              Text(
                'Regulatory Notice',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: accent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...records.map(
                (record) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.paleWarningBg,
                borderRadius: BorderRadius.circular(14),
                border: Border(
                  left: BorderSide(color: accent, width: 4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    record.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colors.paleChipText,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    record.description,
                    style: TextStyle(color: colors.paleChipText),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _KnowledgeSection extends StatelessWidget {
  final String title;
  final List<KnowledgeRecord> records;

  const _KnowledgeSection({
    required this.title,
    required this.records,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // Deliberate compact-list exception: each record is a repeated
          // unit in a potentially long stack, so it keeps its own tighter
          // 14px radius/16px padding rather than the 18px/20px
          // content-card system. Elevation is still dropped (no shadows
          // anywhere in this app) and a hairline border is added in its
          // place -- without one, an elevation-less, colour-less Card
          // would be visually indistinguishable from the page background.
          ...records.map(
                (record) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(color: context.colors.hairline, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            record.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Chip(
                          label: Text(
                            _categoryLabel(record.category),
                            style: const TextStyle(fontSize: 11),
                          ),
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(record.description),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _categoryLabel(KnowledgeCategory category) {
    final name = category.name;

    if (name.isEmpty) {
      return name;
    }

    final withSpaces = name.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
          (match) => '${match.group(1)} ${match.group(2)}',
    );

    return withSpaces[0].toUpperCase() + withSpaces.substring(1);
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: context.colors.primaryForeground),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  value,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
