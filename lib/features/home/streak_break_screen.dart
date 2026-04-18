import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/components/stencil_button.dart';
import '../../design/components/status_marker.dart';
import '../../design/tokens.dart';

class StreakBreakScreen extends StatelessWidget {
  const StreakBreakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Matte black. No grid. No softness. Just the sentence.
    return Scaffold(
      backgroundColor: ChaosColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(ChaosSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StatusMarker(state: StatusMarkerState.failed),
              const Spacer(),
              Text(
                'YOU QUIT\nON YOURSELF.\nAGAIN.',
                style: ChaosTypography.headline().copyWith(
                  fontSize: 56,
                  color: ChaosColors.text,
                  height: 1.0,
                ),
              ),
              const SizedBox(height: ChaosSpacing.lg),
              Text(
                'STREAK TERMINATED.',
                style: ChaosTypography.data().copyWith(
                  color: ChaosColors.alert,
                ),
              ),
              const Spacer(),
              StencilButton(
                label: 'RE-ENLIST',
                trailing: '▸',
                expand: true,
                onPressed: () => context.go(ChaosRoutes.home),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
