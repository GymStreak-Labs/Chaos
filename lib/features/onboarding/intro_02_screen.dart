import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/tokens.dart';
import 'components/value_screen_scaffold.dart';

/// Act 1 — Screen 03. Fact 01 / 03: Calm's demographics.
class Intro02Screen extends StatelessWidget {
  const Intro02Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueScreenScaffold(
      label: 'FACT 01 / 03',
      subtitle:
          'Chaos is built for people who need pressure and action, not calm and reflection.',
      currentStep: 1,
      totalSteps: 6,
      backRoute: ChaosRoutes.intro01,
      title: Text(
        'CALM USERS ARE\n70% WOMEN.',
        style: ChaosTypography.headline(),
      ),
      body: Text(
        'PEACE IS NOT YOUR PROBLEM.',
        style: ChaosTypography.data().copyWith(color: ChaosColors.textMuted),
      ),
      ctaLabel: 'CONTINUE',
      onContinue: () => context.go(ChaosRoutes.intro03),
    );
  }
}
