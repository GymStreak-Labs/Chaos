import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/components/ascii_box.dart';
import '../../design/components/grid_background.dart';
import '../../design/components/stencil_button.dart';
import '../../design/tokens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dateStr = _formatDate(now);

    return Scaffold(
      body: GridBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(ChaosSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dateStr, style: ChaosTypography.label()),
                const SizedBox(height: ChaosSpacing.xs),
                Text('DAY 1 OF OPERATION',
                    style: ChaosTypography.headline().copyWith(fontSize: 28)),
                const SizedBox(height: ChaosSpacing.lg),
                AsciiBox(
                  label: 'SITREP',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('STREAK ......... 0',
                          style: ChaosTypography.data()),
                      Text('ADHERENCE ...... —',
                          style: ChaosTypography.data()),
                      Text('TIER ........... RECRUIT',
                          style: ChaosTypography.data()),
                    ],
                  ),
                ),
                const Spacer(),
                Center(
                  child: GestureDetector(
                    onTap: () => context.go(ChaosRoutes.session),
                    child: _BigLockInTarget(
                      onTap: () => context.go(ChaosRoutes.session),
                    ),
                  ),
                ),
                const Spacer(),
                StencilButton(
                  label: 'STREAK BREAK DEMO',
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

  String _formatDate(DateTime d) {
    const months = [
      'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
      'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC',
    ];
    final dd = d.day.toString().padLeft(2, '0');
    return '$dd ${months[d.month - 1]} ${d.year}';
  }
}

class _BigLockInTarget extends StatelessWidget {
  const _BigLockInTarget({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return StencilButton(
      label: 'LOCK IN',
      trailing: '▸',
      expand: true,
      height: 160,
      onPressed: onTap,
    );
  }
}
