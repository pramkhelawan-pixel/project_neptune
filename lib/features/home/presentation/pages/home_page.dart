import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Neptune'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '🌊 Good Evening',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Ready for your next adventure?',
                style: theme.textTheme.bodyMedium,
              ),

              const SizedBox(height: 24),

              _buildSectionCard(
                context,
                title: 'Today\'s Readiness',
                child: Column(
                  children: [
                    Text(
                      '87%',
                      style: theme.textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Excellent fishing conditions'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _buildSectionCard(
                context,
                title: 'Marine Conditions',
                child: Column(
                  children: const [
                    _InfoRow(icon: Icons.air, label: 'Wind', value: '14 km/h'),
                    Divider(),
                    _InfoRow(icon: Icons.waves, label: 'Swell', value: '1.8 m'),
                    Divider(),
                    _InfoRow(icon: Icons.water, label: 'Tide', value: 'Rising'),
                    Divider(),
                    _InfoRow(
                        icon: Icons.nightlight_round,
                        label: 'Moon',
                        value: 'Waxing'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _buildSectionCard(
                context,
                title: 'Today\'s Recommendation',
                child: Column(
                  children: [
                    Text(
                      '🎣 Kob',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Confidence: 82%'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Text(
                'Quick Actions',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.4,
                children: const [
                  _ActionCard(
                    icon: Icons.phishing,
                    title: 'Log Catch',
                  ),
                  _ActionCard(
                    icon: Icons.map,
                    title: 'Plan Trip',
                  ),
                  _ActionCard(
                    icon: Icons.backpack,
                    title: 'My Tackle',
                  ),
                  _ActionCard(
                    icon: Icons.location_on,
                    title: 'Fishing Spots',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard(
      BuildContext context, {
        required String title,
        required Widget child,
      }) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            child,
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
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 12),
        Expanded(
          child: Text(label),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const _ActionCard({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 34),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}