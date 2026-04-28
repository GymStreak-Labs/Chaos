import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/tokens.dart';
import 'components/value_screen_scaffold.dart';

/// Act 3 — Screen 17. First check-in time.
class CadenceScreen extends StatelessWidget {
  const CadenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueScreenScaffold(
      label: 'TOMORROW.',
      subtitle: 'Here is when Chaos will check in with you first.',
      currentStep: 5,
      totalSteps: 6,
      backRoute: ChaosRoutes.notifications,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '0600.',
            style: ChaosTypography.display().copyWith(fontSize: 112),
          ),
          const SizedBox(height: ChaosSpacing.lg),
          Text('FIRST CHECK-IN.', style: ChaosTypography.dataLarge()),
          const SizedBox(height: ChaosSpacing.md),
          Text(
            'NO SNOOZE.\nNO EXCUSE.',
            style: ChaosTypography.headline().copyWith(
              color: ChaosColors.amber,
            ),
          ),
        ],
      ),
      ctaLabel: 'CONTINUE',
      onContinue: () => context.go(ChaosRoutes.commit),
    );
  }
}
