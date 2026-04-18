import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/components/grid_background.dart';
import '../../design/components/stencil_button.dart';
import '../../design/tokens.dart';

/// Stage-1 paywall stub. RevenueCat wiring comes in Stage 3+.
class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(ChaosSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PAYWALL — STUB', style: ChaosTypography.label()),
                const SizedBox(height: ChaosSpacing.sm),
                Text('ENLIST FULLY.',
                    style: ChaosTypography.headline().copyWith(fontSize: 36)),
                const SizedBox(height: ChaosSpacing.md),
                Text(
                  'REVENUECAT OFFERINGS WIRE IN STAGE 3.',
                  style: ChaosTypography.data().copyWith(
                    color: ChaosColors.textMuted,
                  ),
                ),
                const Spacer(),
                StencilButton(
                  label: 'BACK',
                  expand: true,
                  onPressed: () => context.go(ChaosRoutes.home),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
