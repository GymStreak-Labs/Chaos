import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/components/grid_background.dart';
import '../../design/components/stencil_button.dart';
import '../../design/tokens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
                const Spacer(),
                Text(
                  'CHAOS',
                  style: ChaosTypography.display(),
                ),
                const SizedBox(height: ChaosSpacing.md),
                Text(
                  'WHO NEEDS CALM\nWHEN YOU CAN HAVE CHAOS',
                  style: ChaosTypography.label().copyWith(
                    color: ChaosColors.text,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                StencilButton(
                  label: 'ENLIST',
                  trailing: '▸',
                  expand: true,
                  onPressed: () =>
                      context.go(ChaosRoutes.onboardingPersona),
                ),
                const SizedBox(height: ChaosSpacing.lg),
                Text(
                  'PEACE IS EARNED.',
                  style: ChaosTypography.data().copyWith(
                    color: ChaosColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
