import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/tokens.dart';
import 'components/value_screen_scaffold.dart';

/// Act 1 — Screen 02. Short promise before the three facts.
class Intro01Screen extends StatelessWidget {
  const Intro01Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueScreenScaffold(
      title: Text(
        'BEFORE WE START.\nTHREE FACTS.',
        style: ChaosTypography.headline(),
      ),
      ctaLabel: 'CONTINUE',
      onContinue: () => context.go(ChaosRoutes.intro02),
    );
  }
}
