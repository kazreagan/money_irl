import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_irl/core/storage/hive_service.dart';
import 'scenario_model.dart';
import 'first_scenario.dart';

class ScenarioScreen extends ConsumerStatefulWidget {
  const ScenarioScreen({super.key});

  @override
  ConsumerState<ScenarioScreen> createState() => _ScenarioScreenState();
}

class _ScenarioScreenState extends ConsumerState<ScenarioScreen> {
  ScenarioChoice? selectedChoice;

  @override
  Widget build(BuildContext context) {
    final MoneyScenario scenario = firstMoneyIRLScenario;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            Text(
              scenario.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 12),
            Text(
              scenario.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 32),

            Expanded(
              child: ListView.separated(
                itemCount: scenario.choices.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final choice = scenario.choices[index];
                  final isSelected = selectedChoice == choice;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedChoice = choice;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(),
                        color: isSelected
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                      ),
                      child: Text(
                        choice.label,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  );
                },
              ),
            ),

            if (selectedChoice != null) ...[
              const SizedBox(height: 16),
              Text(
                selectedChoice!.consequence,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedChoice == null
                    ? null
                    : () {
                        HiveService.saveProgress('reflection');
                        context.go('/reflection');
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
