import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/tokens.dart';
import 'components/value_screen_scaffold.dart';

/// Act 3 — Screen 15. The rules of the deal.
class DealScreen extends StatelessWidget {
  const DealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueScreenScaffold(
      label: 'THE DEAL.',
      title: Text(
        'EVERY MORNING.\n'
        'ONE SESSION.\n'
        'ONE QUESTION:\n\n'
        'DID YOU DO\n'
        'THE HARD THING?',
        style: ChaosTypography.headline().copyWith(fontSize: 32),
      ),
      footer: Text(
        'YES OR NO. NO THIRD OPTION.',
        style: ChaosTypography.data().copyWith(
          color: ChaosColors.textMuted,
        ),
      ),
      ctaLabel: 'UNDERSTOOD',
      onContinue: () => context.go(ChaosRoutes.notifications),
    );
  }
}
