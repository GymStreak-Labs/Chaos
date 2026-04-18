import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/components/ascii_box.dart';
import '../../design/tokens.dart';
import 'components/value_screen_scaffold.dart';

/// Act 1 — Screen 04. Fact 02 / 03: 16-hour audit.
class Intro03Screen extends StatelessWidget {
  const Intro03Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueScreenScaffold(
      label: 'FACT 02 / 03',
      subtitle:
          'This app is about recovering wasted time and turning it into action.',
      currentStep: 4,
      totalSteps: 20,
      backRoute: ChaosRoutes.intro02,
      title: Text(
        'YOU HAVE 16\nWAKING HOURS.',
        style: ChaosTypography.headline(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AsciiBox(
            label: 'AUDIT',
            child: Text(
              'WATCHED.......... 4.1H\n'
              'SCROLLED......... 2.8H\n'
              'WORKED........... 6.5H\n'
              'WASTED........... 2.6H',
              style: ChaosTypography.dataLarge(),
            ),
          ),
          const SizedBox(height: ChaosSpacing.lg),
          Text(
            "THAT'S ONE DAY. NOT A GOOD ONE.",
            style: ChaosTypography.data().copyWith(
              color: ChaosColors.textMuted,
            ),
          ),
        ],
      ),
      ctaLabel: 'CONTINUE',
      onContinue: () => context.go(ChaosRoutes.intro04),
    );
  }
}
