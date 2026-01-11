class MoneyScenario {
  final String id;
  final String title;
  final String description;
  final List<ScenarioChoice> choices;

  const MoneyScenario({
    required this.id,
    required this.title,
    required this.description,
    required this.choices,
  });
}

class ScenarioChoice {
  final String label;
  final String consequence;

  const ScenarioChoice({
    required this.label,
    required this.consequence,
  });
}
