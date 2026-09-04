import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/pelav_colors.dart';
import '../providers/catch_provider.dart';
import 'catch_detail_page.dart';
import 'log_catch_page.dart';

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
      floatingActionButton: FloatingActionButton(
        // MainShellPage's IndexedStack keeps every tab mounted at once, so
        // an unset heroTag collides with any other tab's default-tagged
        // FAB (MapsPage) -- "multiple heroes share the same tag".
        heroTag: 'catch-history-fab',
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LogCatchPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: catches.when(
        data: (records) {
          if (records.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.phishing,
                    size: 48,
                    color: context.colors.textTertiary.withValues(alpha: 0.5),
                  ),
                  const SizedBox(height: 16),
                  const Text('No catches logged yet.'),
                ],
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
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          CatchDetailPage(catchRecord: catchRecord),
                    ),
                  );
                },
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