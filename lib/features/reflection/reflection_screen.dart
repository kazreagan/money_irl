import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/storage/hive_service.dart';

class ReflectionScreen extends StatefulWidget {
  const ReflectionScreen({super.key});

  @override
  State<ReflectionScreen> createState() => _ReflectionScreenState();
}

class _ReflectionScreenState extends State<ReflectionScreen> {
  final TextEditingController surprisedCtrl = TextEditingController();
  final TextEditingController realLifeCtrl = TextEditingController();
  final TextEditingController nextTimeCtrl = TextEditingController();

  @override
  void dispose() {
    surprisedCtrl.dispose();
    realLifeCtrl.dispose();
    nextTimeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const SizedBox(height: 40),

            Text(
              'Take a moment',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'This is just for you. You don’t have to write anything.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 32),

            _ReflectionField(
              label: 'What surprised you?',
              controller: surprisedCtrl,
            ),

            const SizedBox(height: 24),

            _ReflectionField(
              label: 'Would you handle this the same way in real life?',
              controller: realLifeCtrl,
            ),

            const SizedBox(height: 24),

            _ReflectionField(
              label: 'What might you try differently next time?',
              controller: nextTimeCtrl,
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Later: persist reflections if desired
                  HiveService.saveProgress('scenario');
                  context.go('/scenario'); // placeholder
                },
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReflectionField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const _ReflectionField({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Optional',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
