import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../design/components/chaos_card.dart';
import '../../design/components/stencil_button.dart';
import '../../design/tokens.dart';

class StreakBreakScreen extends StatelessWidget {
  const StreakBreakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChaosColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(ChaosSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: ChaosColors.alert),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.close_rounded,
                  color: ChaosColors.alert,
                  size: 44,
                ),
              ),
              const SizedBox(height: ChaosSpacing.xl),
              Text(
                'YOU QUIT\nON YOURSELF.\nAGAIN.',
                textAlign: TextAlign.center,
                style: ChaosTypography.headline().copyWith(
                  fontSize: 50,
                  color: ChaosColors.alert,
                  height: 1.0,
                ),
              ),
              const SizedBox(height: ChaosSpacing.md),
              Text(
                'Accountability is the standard.',
                textAlign: TextAlign.center,
                style: ChaosTypography.body().copyWith(
                  color: ChaosColors.textMuted,
                ),
              ),
              const Spacer(),
              ChaosCard(
                borderColor: ChaosColors.alert.withValues(alpha: 0.55),
                backgroundColor: ChaosColors.alert.withValues(alpha: 0.08),
                child: Column(
                  children: [
                    const _FailureRow(label: 'Streak lost', value: '14 days'),
                    const _FailureRow(label: 'Longest', value: '23 days'),
                    _FailureRow(
                      label: 'Last check-in',
                      value: 'Today · did not show up',
                      valueColor: ChaosColors.alert,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: ChaosSpacing.md),
              StencilButton(
                label: 'RE-ENLIST',
                trailing: '›',
                expand: true,
                filled: true,
                accentColor: ChaosColors.alert,
                onPressed: () => context.go(ChaosRoutes.home),
              ),
              const SizedBox(height: ChaosSpacing.sm),
              StencilButton(
                label: 'VIEW RECORD',
                expand: true,
                accentColor: ChaosColors.alert,
                onPressed: () => context.go(ChaosRoutes.home),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FailureRow extends StatelessWidget {
  const _FailureRow({
    required this.label,
    required this.value,
    this.valueColor = ChaosColors.text,
  });

  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: ChaosSpacing.sm),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label.toUpperCase(),
              style: ChaosTypography.body().copyWith(
                color: ChaosColors.textMuted,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            value.toUpperCase(),
            style: ChaosTypography.body().copyWith(
              color: valueColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
