import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/catch_record.dart';

class CatchDetailPage extends StatelessWidget {
  final CatchRecord catchRecord;

  const CatchDetailPage({
    super.key,
    required this.catchRecord,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catchRecord.species),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _HeaderCard(catchRecord: catchRecord),

          if (catchRecord.weightKg != null || catchRecord.lengthCm != null) ...[
            const SizedBox(height: 16),
            _MeasurementsCard(catchRecord: catchRecord),
          ],

          if (catchRecord.bait.isNotEmpty ||
              catchRecord.hook.isNotEmpty ||
              catchRecord.trace.isNotEmpty) ...[
            const SizedBox(height: 16),
            _TackleCard(catchRecord: catchRecord),
          ],

          if (catchRecord.photoPath != null) ...[
            const SizedBox(height: 16),
            _PhotoCard(photoPath: catchRecord.photoPath!),
          ],

          if (catchRecord.notes.isNotEmpty) ...[
            const SizedBox(height: 16),
            _NotesCard(notes: catchRecord.notes),
          ],
        ],
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  final CatchRecord catchRecord;

  const _HeaderCard({required this.catchRecord});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              catchRecord.species,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.place,
              label: 'Location',
              value: catchRecord.location,
            ),
            _InfoRow(
              icon: Icons.calendar_today,
              label: 'Date & Time',
              value: DateFormat('d MMM yyyy, HH:mm')
                  .format(catchRecord.dateTime.toLocal()),
            ),
          ],
        ),
      ),
    );
  }
}

class _MeasurementsCard extends StatelessWidget {
  final CatchRecord catchRecord;

  const _MeasurementsCard({required this.catchRecord});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Measurements',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            if (catchRecord.weightKg != null)
              _InfoRow(
                icon: Icons.scale,
                label: 'Weight',
                value: '${catchRecord.weightKg!.toStringAsFixed(2)} kg',
              ),
            if (catchRecord.lengthCm != null)
              _InfoRow(
                icon: Icons.straighten,
                label: 'Length',
                value: '${catchRecord.lengthCm!.toStringAsFixed(1)} cm',
              ),
          ],
        ),
      ),
    );
  }
}

class _TackleCard extends StatelessWidget {
  final CatchRecord catchRecord;

  const _TackleCard({required this.catchRecord});

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
            if (catchRecord.bait.isNotEmpty)
              _InfoRow(
                icon: Icons.set_meal,
                label: 'Bait',
                value: catchRecord.bait,
              ),
            if (catchRecord.hook.isNotEmpty)
              _InfoRow(
                icon: Icons.hardware,
                label: 'Hook',
                value: catchRecord.hook,
              ),
            if (catchRecord.trace.isNotEmpty)
              _InfoRow(
                icon: Icons.link,
                label: 'Trace',
                value: catchRecord.trace,
              ),
          ],
        ),
      ),
    );
  }
}

class _PhotoCard extends StatelessWidget {
  final String photoPath;

  const _PhotoCard({required this.photoPath});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Photo',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                photoPath,
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotesCard extends StatelessWidget {
  final String notes;

  const _NotesCard({required this.notes});

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
            Text(notes),
          ],
        ),
      ),
    );
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
          Icon(icon, size: 20),
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
