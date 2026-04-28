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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChaosPageHeader(
                  eyebrow: 'SESSION',
                  title: 'DRILL SERGEANT',
                  subtitle: 'Lock-in session. Focus on the mission.',
                  onBack: () => context.go(ChaosRoutes.home),
                ),
                const SizedBox(height: ChaosSpacing.lg),
                ChaosCard(
                  padding: const EdgeInsets.all(ChaosSpacing.lg),
                  child: Column(
                    children: [
                      Text(
                        'UPPER BODY SHUTDOWN',
                        style: ChaosTypography.label().copyWith(
                          color: ChaosColors.text,
                        ),
                      ),
                      const SizedBox(height: ChaosSpacing.lg),
                      SizedBox(
                        width: 210,
                        height: 210,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 190,
                              height: 190,
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
                                    fontSize: 36,
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
                      const SizedBox(height: ChaosSpacing.md),
                      const _Waveform(),
                      const SizedBox(height: ChaosSpacing.lg),
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
                      const SizedBox(height: ChaosSpacing.lg),
                      Text(
                        'Generated audio placeholder. Gemini TTS wires in after this UI pass.',
                        textAlign: TextAlign.center,
                        style: ChaosTypography.body().copyWith(
                          color: ChaosColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
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
                const SizedBox(height: ChaosSpacing.lg),
                StencilButton(
                  label: 'YES',
                  expand: true,
                  filled: true,
                  leadingIcon: Icons.check_rounded,
                  onPressed: () => context.go(ChaosRoutes.home),
                ),
                const SizedBox(height: ChaosSpacing.sm),
                StencilButton(
                  label: 'NO',
                  expand: true,
                  leadingIcon: Icons.close_rounded,
                  onPressed: () => context.go(ChaosRoutes.streakBreak),
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
