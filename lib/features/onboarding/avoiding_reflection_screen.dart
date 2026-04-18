import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/router.dart';
import '../../design/tokens.dart';
import 'components/value_screen_scaffold.dart';
import 'onboarding_prefs.dart';

/// Act 2 — Screen 07. Reflects the user's own words back at them.
class AvoidingReflectionScreen extends StatefulWidget {
  const AvoidingReflectionScreen({super.key});

  @override
  State<AvoidingReflectionScreen> createState() =>
      _AvoidingReflectionScreenState();
}

class _AvoidingReflectionScreenState extends State<AvoidingReflectionScreen> {
  String? _avoiding;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _avoiding = prefs.getString(OnboardingPrefs.avoiding);
    });
  }

  @override
  Widget build(BuildContext context) {
    final echo = (_avoiding ?? 'THE THING').toUpperCase();

    return ValueScreenScaffold(
      label: 'CONFIRMED.',
      subtitle:
          'We are going to build your sessions around the exact thing you entered.',
      currentStep: 7,
      totalSteps: 20,
      backRoute: ChaosRoutes.onboardingAvoiding,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("SO YOU'RE AVOIDING", style: ChaosTypography.headline()),
          const SizedBox(height: ChaosSpacing.md),
          Text(
            echo,
            style: ChaosTypography.headline().copyWith(
              color: ChaosColors.amber,
              fontSize: 44,
            ),
          ),
        ],
      ),
      body: Text(
        "HOW'S THAT WORKING OUT?",
        style: ChaosTypography.data().copyWith(color: ChaosColors.textMuted),
      ),
      ctaLabel: 'GO ON',
      onContinue: () => context.go(ChaosRoutes.duration),
    );
  }
}
