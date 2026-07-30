import 'package:flutter/material.dart';

class LogCatchPage extends StatelessWidget {
  const LogCatchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Catch'),
      ),
      body: const Center(
        child: Text(
          'Catch Logger\nComing Soon',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}