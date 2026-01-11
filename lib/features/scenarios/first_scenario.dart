import 'scenario_model.dart';

final firstMoneyIRLScenario = MoneyScenario(
  id: 'unexpected_expense',
  title: 'An unexpected expense',
  description:
      'Your phone suddenly stops working. You rely on it daily, but repairing it will cost more than you planned for this month.',
  choices: [
    ScenarioChoice(
      label: 'Use money set aside for emergencies',
      consequence:
          'You solve the problem without stress. Your savings shrink, but that is what they were for.',
    ),
    ScenarioChoice(
      label: 'Put the cost on credit',
      consequence:
          'You fix the problem quickly, but you will pay more over time because of interest.',
    ),
    ScenarioChoice(
      label: 'Delay the repair and adjust your routine',
      consequence:
          'It is inconvenient and frustrating, but you avoid spending money right now.',
    ),
  ],
);
