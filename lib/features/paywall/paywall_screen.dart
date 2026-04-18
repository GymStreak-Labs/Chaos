import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/components/chaos_page_header.dart';
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
                ChaosPageHeader(
                  eyebrow: 'UPGRADE',
                  title: 'UNLOCK THE FULL PRODUCT',
                  subtitle:
                      'This is a placeholder paywall. Pricing and plans will replace this screen once RevenueCat is connected.',
                  onBack: () => context.go(ChaosRoutes.commit),
                ),
                const Spacer(),
                StencilButton(
                  label: 'CONTINUE TO APP',
                  expand: true,
                  filled: true,
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
