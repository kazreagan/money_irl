import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'onboarding_notifier.dart';

class LifeSituationScreen extends ConsumerStatefulWidget {
  const LifeSituationScreen({super.key});

  @override
  ConsumerState<LifeSituationScreen> createState() =>
      _LifeSituationScreenState();
}


class _LifeSituationScreenState
    extends ConsumerState<LifeSituationScreen> {
  String? selectedSituation;

  final List<String> situations = [
    'Student',
    'Freelancer',
    'Employed',
    'Family / Caregiver',
    'Retired',
    'Figuring things out',
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
              'Your life, right now',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Choose what best describes your current situation.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.builder(
                itemCount: situations.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final situation = situations[index];
                  final isSelected = selectedSituation == situation;

                  return GestureDetector(
                    onTap: () {
                      ref
                          .read(onboardingProvider.notifier)
                          .setLifeSituation(situation);

                      setState(() {
                        selectedSituation = situation;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(),
                        color: isSelected
                            ? Theme.of(context)
                                .colorScheme
                                .primaryContainer
                            : null,
                      ),
                      child: Text(situation),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedSituation == null
                    ? null
                    : () {
                        context.go('/intention');
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
