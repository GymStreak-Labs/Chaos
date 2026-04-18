import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/home_screen.dart';
import '../features/home/session_screen.dart';
import '../features/home/streak_break_screen.dart';
import '../features/onboarding/avoiding_screen.dart';
import '../features/onboarding/mode_screen.dart';
import '../features/onboarding/persona_screen.dart';
import '../features/onboarding/splash_screen.dart';
import '../features/paywall/paywall_screen.dart';

/// Routes per Stage 1 scope. No auth gates yet.
class ChaosRoutes {
  ChaosRoutes._();

  static const splash = '/splash';
  static const onboardingPersona = '/onboarding/persona';
  static const onboardingAvoiding = '/onboarding/avoiding';
  static const onboardingMode = '/onboarding/mode';
  static const home = '/home';
  static const session = '/session';
  static const paywall = '/paywall';
  static const streakBreak = '/streak-break';
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
    GoRoute(
      path: ChaosRoutes.splash,
      builder: (_, _) => const SplashScreen(),
    ),
    GoRoute(
      path: ChaosRoutes.onboardingPersona,
      builder: (_, _) => const PersonaScreen(),
    ),
    GoRoute(
      path: ChaosRoutes.onboardingAvoiding,
      builder: (_, _) => const AvoidingScreen(),
    ),
    GoRoute(
      path: ChaosRoutes.onboardingMode,
      builder: (_, _) => const ModeScreen(),
    ),
    GoRoute(
      path: ChaosRoutes.home,
      builder: (_, _) => const HomeScreen(),
    ),
    GoRoute(
      path: ChaosRoutes.session,
      builder: (_, _) => const SessionScreen(),
    ),
    GoRoute(
      path: ChaosRoutes.paywall,
      builder: (_, _) => const PaywallScreen(),
    ),
    GoRoute(
      path: ChaosRoutes.streakBreak,
      builder: (_, _) => const StreakBreakScreen(),
    ),
  ],
  errorBuilder: (_, state) => Scaffold(
    body: Center(
      child: Text('ROUTE ERROR: ${state.uri}'),
    ),
  ),
);
