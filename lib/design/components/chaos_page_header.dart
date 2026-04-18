import 'package:flutter/material.dart';

import '../tokens.dart';

/// Shared clarity-first page header.
///
/// Keeps the Chaos visual language but makes screen purpose obvious:
/// - where you are
/// - what this screen is for
/// - how far through the flow you are
class ChaosPageHeader extends StatelessWidget {
  const ChaosPageHeader({
    required this.eyebrow,
    this.title,
    this.subtitle,
    this.currentStep,
    this.totalSteps,
    this.onBack,
    super.key,
  });

  final String eyebrow;
  final String? title;
  final String? subtitle;
  final int? currentStep;
  final int? totalSteps;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (onBack != null) ...[
              TextButton(
                onPressed: onBack,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  foregroundColor: ChaosColors.textMuted,
                ),
                child: Text(
                  '← BACK',
                  style: ChaosTypography.data().copyWith(
                    color: ChaosColors.textMuted,
                  ),
                ),
              ),
              const Spacer(),
            ],
            Text(eyebrow.toUpperCase(), style: ChaosTypography.label()),
          ],
        ),
        if (currentStep != null && totalSteps != null) ...[
          const SizedBox(height: ChaosSpacing.md),
          _ProgressBar(currentStep: currentStep!, totalSteps: totalSteps!),
          const SizedBox(height: ChaosSpacing.md),
          Text(
            'STEP $currentStep OF $totalSteps',
            style: ChaosTypography.data().copyWith(
              color: ChaosColors.textMuted,
            ),
          ),
        ] else
          const SizedBox(height: ChaosSpacing.sm),
        if (title != null && title!.isNotEmpty) ...[
          const SizedBox(height: ChaosSpacing.sm),
          Text(title!, style: ChaosTypography.headline()),
        ],
        if (subtitle != null) ...[
          const SizedBox(height: ChaosSpacing.sm),
          Text(
            subtitle!,
            style: ChaosTypography.body().copyWith(
              color: ChaosColors.textMuted,
              fontSize: 16,
              height: 1.45,
            ),
          ),
        ],
      ],
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.currentStep, required this.totalSteps});

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    final progress = (currentStep / totalSteps).clamp(0.0, 1.0);
    return SizedBox(
      height: 6,
      child: Stack(
        children: [
          Container(color: ChaosColors.grid),
          FractionallySizedBox(
            widthFactor: progress,
            child: Container(color: ChaosColors.amber),
          ),
        ],
      ),
    );
  }
}
