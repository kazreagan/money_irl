import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../onboarding/onboarding_notifier.dart';
import 'package:go_router/go_router.dart';

class DebugScenarioScreen extends ConsumerWidget {
  const DebugScenarioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboarding = ref.watch(onboardingProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Money IRL — Debug',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            Text(
              'Life situation:\n${onboarding.lifeSituation ?? "Not set"}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Intention:\n${onboarding.intention ?? "Not set"}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                ref.read(onboardingProvider.notifier).reset();
                context.go('/');
              },
              child: const Text('Reset & Start Over'),
            ),
          ],
        ),
      ),
    );
  }
}
