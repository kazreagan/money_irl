import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../../core/storage/hive_service.dart';

class IntentionScreen extends StatefulWidget {
  const IntentionScreen({super.key});

  @override
  State<IntentionScreen> createState() => _IntentionScreenState();
}

class _IntentionScreenState extends State<IntentionScreen> {
  String? selectedIntention;

  final List<String> intentions = [
    'Managing money month to month',
    'Handling debt with less stress',
    'Building emergency savings',
    'Understanding everyday economics',
    'Feeling more in control overall',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            Text(
              'What would you like to feel more confident about?',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 12),

            Text(
              'There’s no right answer. Choose what matters to you right now.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 32),

            Expanded(
              child: ListView.separated(
                itemCount: intentions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final intention = intentions[index];
                  final isSelected = selectedIntention == intention;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIntention = intention;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: isSelected
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.surface,
                        border: Border.all(
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).dividerColor,
                        ),
                      ),
                      child: Text(
                        intention,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedIntention == null
                    ? null
                    : () {
                        // later: save intention
                        HiveService.saveProgress('scenario');
                        // context.go('/scenario');
                        context.go('/reassurance');
                      },
                child: const Text("Let's begin"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
