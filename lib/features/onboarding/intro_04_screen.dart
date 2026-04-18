import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/tokens.dart';
import 'components/value_screen_scaffold.dart';

/// Act 1 — Screen 05. Fact 03 / 03: the framing. This is the climactic
/// Act 1 moment — CTA is amber-filled ("ENLIST ▸").
class Intro04Screen extends StatelessWidget {
  const Intro04Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueScreenScaffold(
      label: 'FACT 03 / 03',
      title: Text(
        'CHAOS IS NOT\nA MEDITATION APP.\n'
        'CHAOS IS NOT\nA THERAPIST.\n\n'
        'CHAOS IS\nA DRAFT NOTICE.',
        style: ChaosTypography.headline().copyWith(fontSize: 40),
      ),
      ctaLabel: 'ENLIST',
      ctaFilled: true,
      onContinue: () => context.go(ChaosRoutes.onboardingAvoiding),
    );
  }
}
