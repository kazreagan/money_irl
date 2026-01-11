import 'package:go_router/go_router.dart';
import 'start_resolver.dart';

import '../../features/onboarding/onboarding_screen.dart';
import '../../features/onboarding/life_situation_screen.dart';
import '../../features/onboarding/intention_screen.dart';
import '../../features/scenarios/scenario_screen.dart';
import '../../features/reflection/reflection_screen.dart';
import '../../features/reassurance/reassurance_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: resolveStartRoute(),
  routes: [
    GoRoute(
      path: '/',
      name: 'welcome',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/life-situation',
      name: 'lifeSituation',
      builder: (context, state) => const LifeSituationScreen(),
    ),
    GoRoute(
      path: '/intention',
      name: 'intention',
      builder: (context, state) => const IntentionScreen(),
    ),
    GoRoute(
      path: '/scenario',
      name: 'scenario',
      builder: (context, state) => const ScenarioScreen(),
    ),
    GoRoute(
      path: '/reflection',
      name: 'reflection',
      builder: (context, state) => const ReflectionScreen(),
    ),
    GoRoute(
      path: '/reassurance',
      builder: (context, state) => const ReassuranceScreen(),
    ),
  ],
);
