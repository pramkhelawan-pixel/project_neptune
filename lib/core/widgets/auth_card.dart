import 'package:flutter/material.dart';

class AuthCard extends StatelessWidget {
  const AuthCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: child,
      ),
    );
  }
}