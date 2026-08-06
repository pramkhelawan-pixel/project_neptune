import 'package:flutter/material.dart';

import '../../data/all_species_profiles.dart';
import '../../domain/species.dart';
import 'species_detail_page.dart';

class SpeciesListPage extends StatefulWidget {
  const SpeciesListPage({super.key});

  @override
  State<SpeciesListPage> createState() => _SpeciesListPageState();
}

class _SpeciesListPageState extends State<SpeciesListPage> {
  bool _showEdible = true;

  @override
  Widget build(BuildContext context) {
    final species = _showEdible ? allSpeciesProfiles : nonEdibleSpeciesProfiles;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: SegmentedButton<bool>(
            segments: const [
              ButtonSegment(
                value: true,
                label: Text('Edible'),
                icon: Icon(Icons.set_meal),
              ),
              ButtonSegment(
                value: false,
                label: Text('Non-Edible'),
                icon: Icon(Icons.phishing),
              ),
            ],
            selected: {_showEdible},
            onSelectionChanged: (selection) {
              setState(() {
                _showEdible = selection.first;
              });
            },
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            itemCount: species.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return _SpeciesTile(species: species[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _SpeciesTile extends StatelessWidget {
  final Species species;

  const _SpeciesTile({required this.species});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: CircleAvatar(
          child: Icon(species.isEdible ? Icons.set_meal : Icons.phishing),
        ),
        title: Text(
          species.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          species.scientificName,
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SpeciesDetailPage(
                species: species,
              ),
            ),
          );
        },
      ),
    );
  }
}
