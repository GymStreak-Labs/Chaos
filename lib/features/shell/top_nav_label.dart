import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../design/tokens.dart';

/// Single label inside the 3-slot top navigation strip.
///
/// Active → `[ LABEL ]` in amber. Inactive → ` LABEL ` in muted text.
/// Widths stay roughly stable thanks to the leading/trailing space on
/// inactive labels, so tapping between siblings doesn't reshuffle the row.
class TopNavLabel extends StatelessWidget {
  const TopNavLabel({
    required this.label,
    required this.active,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = active ? '[ ${label.toUpperCase()} ]' : ' ${label.toUpperCase()} ';
    final color = active ? ChaosColors.amber : ChaosColors.textMuted;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: ChaosSpacing.sm,
          horizontal: ChaosSpacing.xs,
        ),
        child: Text(
          text,
          style: ChaosTypography.label().copyWith(color: color),
          maxLines: 1,
          softWrap: false,
        ),
      ),
    );
  }
}
