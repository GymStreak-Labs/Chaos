import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/components/chaos_card.dart';
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
                  title: 'UNLOCK YOUR FULL POTENTIAL',
                  subtitle:
                      'More voices. Longer sessions. Unlimited regeneration. Earn your peace.',
                  onBack: () => context.go(ChaosRoutes.commit),
                ),
                const SizedBox(height: ChaosSpacing.lg),
                ChaosCard(
                  child: Column(
                    children: const [
                      _UnlockRow(
                        icon: Icons.record_voice_over_rounded,
                        title: 'All voices',
                        subtitle: 'Four voices to choose from',
                      ),
                      _UnlockRow(
                        icon: Icons.timer_outlined,
                        title: 'Longer sessions',
                        subtitle: 'Up to 90 minutes',
                      ),
                      _UnlockRow(
                        icon: Icons.refresh_rounded,
                        title: 'Unlimited regeneration',
                        subtitle: 'Regenerate any session',
                      ),
                      _UnlockRow(
                        icon: Icons.gps_fixed_rounded,
                        title: 'Progression and earned peace',
                        subtitle: 'Unlock at Legion and beyond',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: ChaosSpacing.md),
                Row(
                  children: const [
                    Expanded(
                      child: _PriceCard(
                        title: 'Monthly',
                        price: r'$9.99',
                        subtitle: 'per month',
                        active: true,
                      ),
                    ),
                    SizedBox(width: ChaosSpacing.md),
                    Expanded(
                      child: _PriceCard(
                        title: 'Yearly',
                        price: r'$79.99',
                        subtitle: 'per year',
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                StencilButton(
                  label: 'UNLOCK CHAOS',
                  expand: true,
                  filled: true,
                  onPressed: () => context.go(ChaosRoutes.home),
                ),
                const SizedBox(height: ChaosSpacing.sm),
                Center(
                  child: Text(
                    'Cancel anytime. No excuses.',
                    style: ChaosTypography.body().copyWith(
                      color: ChaosColors.textMuted,
                      fontSize: 12,
                    ),
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

class _UnlockRow extends StatelessWidget {
  const _UnlockRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: ChaosSpacing.md),
      child: Row(
        children: [
          ChaosIconTile(icon: icon, size: 42),
          const SizedBox(width: ChaosSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: ChaosTypography.label().copyWith(
                    color: ChaosColors.text,
                    fontSize: 14,
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
      ),
    );
  }
}

class _PriceCard extends StatelessWidget {
  const _PriceCard({
    required this.title,
    required this.price,
    required this.subtitle,
    this.active = false,
  });

  final String title;
  final String price;
  final String subtitle;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return ChaosCard(
      borderColor: active ? ChaosColors.amber : ChaosColors.border,
      backgroundColor: active
          ? ChaosColors.amber.withValues(alpha: 0.08)
          : ChaosColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: ChaosTypography.label().copyWith(
              color: active ? ChaosColors.amber : ChaosColors.textMuted,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: ChaosSpacing.sm),
          Text(price, style: ChaosTypography.headline().copyWith(fontSize: 30)),
          Text(
            subtitle,
            style: ChaosTypography.body().copyWith(
              color: ChaosColors.textMuted,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
