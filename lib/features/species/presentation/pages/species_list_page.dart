import 'package:flutter/material.dart';

import '../../data/all_species_profiles.dart';
import '../../domain/species.dart';
import 'species_detail_page.dart';

class SpeciesListPage extends StatelessWidget {
  const SpeciesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: allSpeciesProfiles.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final species = allSpeciesProfiles[index];

        return _SpeciesTile(species: species);
      },
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
        leading: const CircleAvatar(
          child: Icon(Icons.phishing),
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
