class OnboardingState {
  final String? lifeSituation;
  final String? intention;

  const OnboardingState({
    this.lifeSituation,
    this.intention,
  });

  OnboardingState copyWith({
    String? lifeSituation,
    String? intention,
  }) {
    return OnboardingState(
      lifeSituation: lifeSituation ?? this.lifeSituation,
      intention: intention ?? this.intention,
    );
  }
}