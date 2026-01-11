import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/storage/hive_service.dart';
import 'onboarding_state.dart';

// class OnboardingNotifier extends StateNotifier<OnboardingState> {
//   OnboardingNotifier() : super(const OnboardingState());

//   void setLifeSituation(String value) {
//     state = state.copyWith(lifeSituation: value);
//   }

//   void setIntention(String value) {
//     state = state.copyWith(intention: value);
//   }

//   void reset() {
//     state = const OnboardingState();
//   }
// }

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier() : super(const OnboardingState()) {
    _loadFromHive();
  }

  void _loadFromHive() {
    final life = HiveService.getLifeSituation();
    final intention = HiveService.getIntention();

    state = OnboardingState(
      lifeSituation: life,
      intention: intention,
    );
  }

  void setLifeSituation(String value) {
    HiveService.saveLifeSituation(value);
    state = state.copyWith(lifeSituation: value);
  }

  void setIntention(String value) {
    HiveService.saveIntention(value);
    state = state.copyWith(intention: value);
  }

  void reset() async {
    await HiveService.clearOnboarding();
    state = const OnboardingState();
  }
}

final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>(
  (ref) => OnboardingNotifier(),
);