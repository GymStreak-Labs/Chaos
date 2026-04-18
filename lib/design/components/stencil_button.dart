import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../tokens.dart';

/// Flat amber-bordered uppercase stencil button.
/// Heavy haptic on tap. No ripple, no elevation, no rounding.
class StencilButton extends StatelessWidget {
  const StencilButton({
    required this.label,
    required this.onPressed,
    this.trailing,
    this.expand = false,
    this.height = 64,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final String? trailing;
  final bool expand;
  final double height;

  @override
  Widget build(BuildContext context) {
    final disabled = onPressed == null;
    final color = disabled ? ChaosColors.textMuted : ChaosColors.amber;

    final button = InkWell(
      onTap: disabled
          ? null
          : () {
              HapticFeedback.heavyImpact();
              onPressed!();
            },
      splashColor: Colors.transparent,
      highlightColor: const Color(0x22C4A000),
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: ChaosSpacing.lg),
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label.toUpperCase(),
              style: ChaosTypography.button().copyWith(color: color),
            ),
            if (trailing != null) ...[
              const SizedBox(width: ChaosSpacing.md),
              Text(
                trailing!,
                style: ChaosTypography.button().copyWith(color: color),
              ),
            ],
          ],
        ),
      ),
    );

    return expand
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}
