import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/session_screen.dart';
import '../features/home/streak_break_screen.dart';
import '../features/home/strike_screen.dart';
import '../features/onboarding/avoiding_reflection_screen.dart';
import '../features/onboarding/avoiding_screen.dart';
import '../features/onboarding/cadence_screen.dart';
import '../features/onboarding/commit_screen.dart';
import '../features/onboarding/deal_screen.dart';
import '../features/onboarding/duration_reflection_screen.dart';
import '../features/onboarding/duration_screen.dart';
import '../features/onboarding/intro_01_screen.dart';
import '../features/onboarding/intro_02_screen.dart';
import '../features/onboarding/intro_03_screen.dart';
import '../features/onboarding/intro_04_screen.dart';
import '../features/onboarding/lie_reflection_screen.dart';
import '../features/onboarding/lie_screen.dart';
import '../features/onboarding/mode_screen.dart';
import '../features/onboarding/notifications_screen.dart';
import '../features/onboarding/persona_intro_screen.dart';
import '../features/onboarding/persona_screen.dart';
import '../features/onboarding/splash_screen.dart';
import '../features/paywall/paywall_screen.dart';
import '../features/shell/main_shell.dart';

/// Route constants for first-strike onboarding + core app.
class ChaosRoutes {
  ChaosRoutes._();

  static const splash = '/splash';

  // Act 1 — confrontation
  static const intro01 = '/onboarding/intro-01';
  static const intro02 = '/onboarding/intro-02';
  static const intro03 = '/onboarding/intro-03';
  static const intro04 = '/onboarding/intro-04';

  // Act 2 — diagnostic
  static const onboardingAvoiding = '/onboarding/avoiding';
  static const avoidingReflection = '/onboarding/avoiding-reflection';
  static const duration = '/onboarding/duration';
  static const durationReflection = '/onboarding/duration-reflection';
  static const lie = '/onboarding/lie';
  static const lieReflection = '/onboarding/lie-reflection';

  // Act 3 — assignment
  static const onboardingPersona = '/onboarding/persona';
  static const personaIntro = '/onboarding/persona-intro';
  static const onboardingMode = '/onboarding/mode';
  static const deal = '/onboarding/deal';
  static const notifications = '/onboarding/notifications';
  static const cadence = '/onboarding/cadence';

  // Act 4 — enlistment
  static const commit = '/onboarding/commit';

  // Core app
  static const home = '/home';
  static const session = '/session';
  static const paywall = '/paywall';
  static const streakBreak = '/streak-break';
  static const strike = '/strike';
}

/// Internal: lets us jump straight to a screen for screenshot / QA runs.
/// Ignored in release builds. Takes precedence: dart-define → platform env.
String _resolveInitialLocation() {
  if (kReleaseMode) return ChaosRoutes.splash;
  const dartDefine = String.fromEnvironment('CHAOS_INITIAL_ROUTE');
  if (dartDefine.isNotEmpty) return dartDefine;
  try {
    final env = Platform.environment['CHAOS_INITIAL_ROUTE'];
    if (env != null && env.isNotEmpty) return env;
  } catch (_) {}
  return ChaosRoutes.splash;
}

final GoRouter chaosRouter = GoRouter(
  initialLocation: _resolveInitialLocation(),
  routes: [
    GoRoute(path: ChaosRoutes.splash, builder: (_, _) => const SplashScreen()),

    // Act 1
    GoRoute(
      path: ChaosRoutes.intro01,
      builder: (_, _) => const Intro01Screen(),
    ),
    GoRoute(
      path: ChaosRoutes.intro02,
      builder: (_, _) => const Intro02Screen(),
    ),
    GoRoute(
      path: ChaosRoutes.intro03,
      builder: (_, _) => const Intro03Screen(),
    ),
    GoRoute(
      path: ChaosRoutes.intro04,
      builder: (_, _) => const Intro04Screen(),
    ),

    // Act 2
    GoRoute(
      path: ChaosRoutes.onboardingAvoiding,
      builder: (_, _) => const AvoidingScreen(),
    ),
    GoRoute(
      path: ChaosRoutes.avoidingReflection,
      builder: (_, _) => const AvoidingReflectionScreen(),
    ),
    GoRoute(
      path: ChaosRoutes.duration,
      builder: (_, _) => const DurationScreen(),
    ),
    GoRoute(
      path: ChaosRoutes.durationReflection,
      builder: (_, _) => const DurationReflectionScreen(),
    ),
    GoRoute(path: ChaosRoutes.lie, builder: (_, _) => const LieScreen()),
    GoRoute(
      path: ChaosRoutes.lieReflection,
      builder: (_, _) => const LieReflectionScreen(),
    ),

    // Act 3
    GoRoute(
      path: ChaosRoutes.onboardingPersona,
      builder: (_, _) => const PersonaScreen(),
    ),
    GoRoute(
      path: ChaosRoutes.personaIntro,
      builder: (_, _) => const PersonaIntroScreen(),
    ),
    GoRoute(
      path: ChaosRoutes.onboardingMode,
      builder: (_, _) => const ModeScreen(),
    ),
    GoRoute(path: ChaosRoutes.deal, builder: (_, _) => const DealScreen()),
    GoRoute(
      path: ChaosRoutes.notifications,
      builder: (_, _) => const NotificationsScreen(),
    ),
    GoRoute(
      path: ChaosRoutes.cadence,
      builder: (_, _) => const CadenceScreen(),
    ),

    // Act 4
    GoRoute(path: ChaosRoutes.commit, builder: (_, _) => const CommitScreen()),

    // Core app
    GoRoute(path: ChaosRoutes.home, builder: (_, _) => const MainShell()),
    GoRoute(
      path: ChaosRoutes.session,
      builder: (_, _) => const SessionScreen(),
    ),
    GoRoute(
      path: ChaosRoutes.paywall,
      builder: (_, _) => const PaywallScreen(),
    ),
    GoRoute(path: ChaosRoutes.strike, builder: (_, _) => const StrikeScreen()),
    GoRoute(
      path: ChaosRoutes.streakBreak,
      builder: (_, _) => const StreakBreakScreen(),
    ),
  ],
  errorBuilder: (_, state) =>
      Scaffold(body: Center(child: Text('ROUTE ERROR: ${state.uri}'))),
);
