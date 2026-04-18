import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../tokens.dart';
import 'status_marker.dart';

/// Single-line selectable row used by duration / lie pickers.
/// Left-aligned uppercase label, trailing [StatusMarker].
/// Tap toggles selection, heavy-ish haptic via [HapticFeedback.selectionClick].
class OptionRow extends StatelessWidget {
  const OptionRow({
    required this.label,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? ChaosColors.amber : ChaosColors.text;
    return InkWell(
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      splashColor: Colors.transparent,
      highlightColor: const Color(0x22C4A000),
      child: Container(
        padding: const EdgeInsets.all(ChaosSpacing.md),
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? ChaosColors.amber : ChaosColors.grid,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label.toUpperCase(),
                style: ChaosTypography.headline().copyWith(
                  color: color,
                  fontSize: 22,
                ),
              ),
            ),
            if (selected)
              const StatusMarker(state: StatusMarkerState.active)
            else
              const StatusMarker(state: StatusMarkerState.incomplete),
          ],
        ),
      ),
    );
  }
}
