import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/components/chaos_card.dart';
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Center(
                  child: Container(
                    width: 84,
                    height: 84,
                    decoration: BoxDecoration(
                      color: ChaosColors.amber.withValues(alpha: 0.12),
                      border: Border.all(color: ChaosColors.amber),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.keyboard_double_arrow_up_rounded,
                      color: ChaosColors.amber,
                      size: 48,
                    ),
                  ),
                ),
                const SizedBox(height: ChaosSpacing.xl),
                Center(
                  child: Text(
                    'CHAOS',
                    textAlign: TextAlign.center,
                    style: ChaosTypography.display().copyWith(
                      color: ChaosColors.amber,
                      fontSize: 82,
                    ),
                  ),
                ),
                const SizedBox(height: ChaosSpacing.md),
                Text(
                  'Live accountability strikes.\nStart the thing.',
                  textAlign: TextAlign.center,
                  style: ChaosTypography.headline().copyWith(fontSize: 26),
                ),
                const SizedBox(height: ChaosSpacing.xl),
                const ChaosCard(
                  child: Column(
                    children: [
                      _SplashFeature(
                        icon: Icons.flag_outlined,
                        title: 'Declare the target',
                        subtitle: 'Name the hard thing you are avoiding.',
                      ),
                      SizedBox(height: ChaosSpacing.md),
                      _SplashFeature(
                        icon: Icons.check_circle_outline_rounded,
                        title: 'Prove the strike',
                        subtitle: 'Done or failed. No mood tracker.',
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                StencilButton(
                  label: 'START FIRST STRIKE',
                  trailing: '▸',
                  filled: true,
                  expand: true,
                  onPressed: () => context.go(ChaosRoutes.onboardingAvoiding),
                ),
                const SizedBox(height: ChaosSpacing.lg),
                Text(
                  "WHO NEEDS CALM WHEN YOU CAN HAVE CHAOS.",
                  textAlign: TextAlign.center,
                  style: ChaosTypography.body().copyWith(
                    color: ChaosColors.textMuted,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
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

class _SplashFeature extends StatelessWidget {
  const _SplashFeature({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChaosIconTile(icon: icon, size: 44),
        const SizedBox(width: ChaosSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toUpperCase(),
                style: ChaosTypography.label().copyWith(
                  color: ChaosColors.text,
                  fontSize: 13,
                ),
              ),
              Text(
                subtitle,
                style: ChaosTypography.body().copyWith(
                  color: ChaosColors.textMuted,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
