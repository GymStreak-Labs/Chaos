import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/components/chaos_card.dart';
import '../../design/components/chaos_page_header.dart';
import '../../design/components/grid_background.dart';
import '../../design/components/stencil_button.dart';
import '../../design/tokens.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(ChaosSpacing.lg),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ChaosPageHeader(
                  eyebrow: 'SESSION',
                  title: 'DRILL SERGEANT',
                  subtitle: 'Focus on the mission. No drift. No negotiation.',
                  onBack: () => context.go(ChaosRoutes.home),
                ),
                const SizedBox(height: ChaosSpacing.md),
                ChaosCard(
                  padding: const EdgeInsets.all(ChaosSpacing.md),
                  child: Column(
                    children: [
                      Text(
                        'LOCK-IN SESSION',
                        style: ChaosTypography.label().copyWith(
                          color: ChaosColors.text,
                        ),
                      ),
                      const SizedBox(height: ChaosSpacing.sm),
                      SizedBox(
                        width: 140,
                        height: 140,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 128,
                              height: 128,
                              child: CircularProgressIndicator(
                                value: 0.42,
                                strokeWidth: 12,
                                backgroundColor: ChaosColors.surfaceRaised,
                                color: ChaosColors.amber,
                                strokeCap: StrokeCap.round,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '18:27',
                                  style: ChaosTypography.headline().copyWith(
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  'OF 45:00',
                                  style: ChaosTypography.body().copyWith(
                                    color: ChaosColors.textMuted,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: ChaosSpacing.sm),
                      const _Waveform(),
                      const SizedBox(height: ChaosSpacing.sm),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _RoundControl(
                            icon: Icons.replay_10_rounded,
                            onTap: () {},
                          ),
                          _RoundControl(
                            icon: Icons.pause_rounded,
                            primary: true,
                            onTap: () {},
                          ),
                          _RoundControl(
                            icon: Icons.forward_10_rounded,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: ChaosSpacing.lg),
                Text(
                  'Did you do the hard thing?',
                  style: ChaosTypography.headline().copyWith(fontSize: 26),
                ),
                const SizedBox(height: ChaosSpacing.sm),
                Text(
                  'Tap YES if you followed through. Tap NO if you didn’t.',
                  style: ChaosTypography.body().copyWith(
                    color: ChaosColors.textMuted,
                  ),
                ),
                const SizedBox(height: ChaosSpacing.md),
                Row(
                  children: [
                    Expanded(
                      child: StencilButton(
                        label: 'YES',
                        expand: true,
                        filled: true,
                        height: 56,
                        leadingIcon: Icons.check_rounded,
                        onPressed: () => context.go(ChaosRoutes.home),
                      ),
                    ),
                    const SizedBox(width: ChaosSpacing.sm),
                    Expanded(
                      child: StencilButton(
                        label: 'NO',
                        expand: true,
                        height: 56,
                        accentColor: ChaosColors.alert,
                        leadingIcon: Icons.close_rounded,
                        onPressed: () => context.go(ChaosRoutes.streakBreak),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Waveform extends StatelessWidget {
  const _Waveform();

  @override
  Widget build(BuildContext context) {
    const heights = [
      14.0,
      28.0,
      18.0,
      36.0,
      24.0,
      44.0,
      30.0,
      20.0,
      34.0,
      16.0,
      26.0,
      40.0,
      22.0,
      30.0,
      18.0,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var i = 0; i < heights.length; i++) ...[
          Container(
            width: 4,
            height: heights[i],
            decoration: BoxDecoration(
              color: i < 9 ? ChaosColors.amber : ChaosColors.border,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          if (i < heights.length - 1) const SizedBox(width: 5),
        ],
      ],
    );
  }
}

class _RoundControl extends StatelessWidget {
  const _RoundControl({
    required this.icon,
    required this.onTap,
    this.primary = false,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final size = primary ? 64.0 : 46.0;
    final color = primary ? ChaosColors.text : ChaosColors.textMuted;

    return InkWell(
      borderRadius: BorderRadius.circular(size / 2),
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: primary ? ChaosColors.text : ChaosColors.border,
          ),
          color: primary ? ChaosColors.surfaceRaised : Colors.transparent,
        ),
        child: Icon(icon, color: color, size: primary ? 34 : 24),
      ),
    );
  }
}
