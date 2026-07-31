import 'package:flutter/material.dart';

class FishingWindowCard extends StatelessWidget {
  final String window;

  const FishingWindowCard({
    super.key,
    required this.window,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.schedule,
        ),
        title: const Text(
          'Best Fishing Window',
        ),
        subtitle: Text(window),
      ),
    );
  }
}