import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/components/chaos_page_header.dart';
import '../../design/components/ascii_box.dart';
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
                  title: 'RAGE-UP / 7 MIN',
                  subtitle:
                      'Listen to your session, then answer the one check-in question below.',
                  onBack: () => context.go(ChaosRoutes.home),
                ),
                const SizedBox(height: ChaosSpacing.lg),
                AsciiBox(
                  label: 'AUDIO',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '[SESSION WILL GENERATE HERE]',
                        style: ChaosTypography.data().copyWith(
                          color: ChaosColors.amber,
                        ),
                      ),
                      const SizedBox(height: ChaosSpacing.sm),
                      Text(
                        'TTS STUB — GEMINI WIRING IS STAGE 3.',
                        style: ChaosTypography.data().copyWith(
                          color: ChaosColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  'DID YOU DO THE HARD THING?',
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
                  onPressed: () => context.go(ChaosRoutes.home),
                ),
                const SizedBox(height: ChaosSpacing.sm),
                StencilButton(
                  label: 'NO',
                  expand: true,
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
