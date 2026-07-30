import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/catch_provider.dart';

class CatchHistoryPage extends ConsumerWidget {
  const CatchHistoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catches = ref.watch(catchHistoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catch History'),
      ),
      body: catches.when(
        data: (records) {
          if (records.isEmpty) {
            return const Center(
              child: Text(
                'No catches logged yet.',
              ),
            );
          }

          return ListView.separated(
            itemCount: records.length,
            separatorBuilder: (context, index) =>
            const Divider(
              height: 1,
            ),
            itemBuilder: (context, index) {
              final catchRecord = records[index];

              return ListTile(
                leading: const Icon(
                  Icons.phishing,
                ),
                title: Text(
                  catchRecord.species,
                ),
                subtitle: Text(
                  catchRecord.location,
                ),
                trailing: Text(
                  '${catchRecord.dateTime.day}/${catchRecord.dateTime.month}/${catchRecord.dateTime.year}',
                ),
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text(
            'Error: $error',
          ),
        ),
      ),
    );
  }
}