import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/tokens.dart';
import 'components/value_screen_scaffold.dart';

/// Act 4 — Screen 18. Final commitment beat. Climactic amber-filled CTA.
class CommitScreen extends StatelessWidget {
  const CommitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueScreenScaffold(
      label: 'FINAL STEP.',
      subtitle: 'You are about to finish onboarding and enter the app.',
      currentStep: 18,
      totalSteps: 20,
      backRoute: ChaosRoutes.cadence,
      title: Text("YOU'RE ABOUT TO ENLIST.", style: ChaosTypography.headline()),
      body: Text(
        'BY CONTINUING YOU AGREE\n'
        'THAT FROM TOMORROW\n'
        'YOU ARE ACCOUNTABLE\n'
        'TO YOURSELF.\n\n'
        'NO ONE ELSE WILL\n'
        'HOLD THE LINE.',
        style: ChaosTypography.data().copyWith(
          color: ChaosColors.textMuted,
          fontSize: 16,
        ),
      ),
      ctaLabel: 'I AGREE',
      ctaFilled: true,
      onContinue: () => context.go(ChaosRoutes.paywall),
      secondaryLabel: 'BACK OUT',
      onSecondary: () => context.go(ChaosRoutes.splash),
    );
  }
}
