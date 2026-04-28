import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../tokens.dart';

/// Flat amber-bordered uppercase stencil button.
/// Heavy haptic on tap. No ripple, no elevation, no rounding.
///
/// When [filled] is true the button fills with amber and draws text in
/// matte-black — used for climactic CTAs ("ENLIST", "I AGREE",
/// "ALLOW NOTIFICATIONS"). Defaults to the existing bordered look.
class StencilButton extends StatelessWidget {
  const StencilButton({
    required this.label,
    required this.onPressed,
    this.trailing,
    this.leadingIcon,
    this.expand = false,
    this.filled = false,
    this.height = 64,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final String? trailing;
  final IconData? leadingIcon;
  final bool expand;
  final bool filled;
  final double height;

  @override
  Widget build(BuildContext context) {
    final disabled = onPressed == null;

    // Border / background / text colour are all driven by [filled] + [disabled].
    final Color borderColor = disabled
        ? ChaosColors.textMuted
        : ChaosColors.amber;
    final Color backgroundColor = filled && !disabled
        ? ChaosColors.amber
        : Colors.transparent;
    final Color textColor;
    if (disabled) {
      textColor = ChaosColors.textMuted;
    } else if (filled) {
      textColor = ChaosColors.background;
    } else {
      textColor = ChaosColors.amber;
    }

    final button = InkWell(
      onTap: disabled
          ? null
          : () {
              HapticFeedback.heavyImpact();
              onPressed!();
            },
      splashColor: Colors.transparent,
      highlightColor: filled
          ? const Color(0x22000000)
          : const Color(0x22C4A000),
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: ChaosSpacing.lg),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (expand)
              Expanded(
                child: Row(
                  children: [
                    if (leadingIcon != null) ...[
                      Icon(leadingIcon, color: textColor, size: 22),
                      const SizedBox(width: ChaosSpacing.sm),
                    ],
                    Expanded(
                      child: Text(
                        label.toUpperCase(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: ChaosTypography.button().copyWith(
                          color: textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else ...[
              if (leadingIcon != null) ...[
                Icon(leadingIcon, color: textColor, size: 22),
                const SizedBox(width: ChaosSpacing.sm),
              ],
              Text(
                label.toUpperCase(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: ChaosTypography.button().copyWith(color: textColor),
              ),
            ],
            if (trailing != null) ...[
              const SizedBox(width: ChaosSpacing.md),
              Text(
                trailing!,
                style: ChaosTypography.button().copyWith(color: textColor),
              ),
            ],
          ],
        ),
      ),
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
