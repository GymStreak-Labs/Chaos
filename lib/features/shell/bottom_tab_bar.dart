import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../design/tokens.dart';

/// Brutalist bottom tab bar for [MainShell].
///
/// Three equal-width tap targets:
///
///   TODAY    RECORD    PROFILE
///
/// - Matte black background, 1px olive hairline across the top edge.
/// - A 2px amber indicator segment sits above the active tab (inset 16pt
///   each side) and slides to the tapped tab over 120ms linear.
/// - No icons, no badges, no ripple, no Material chrome.
/// - Respects the home-indicator inset via [SafeArea].
class ChaosBottomTabBar extends StatelessWidget {
  const ChaosBottomTabBar({
    required this.index,
    required this.onTap,
    super.key,
  });

  /// Currently-selected tab (0 = TODAY, 1 = RECORD, 2 = PROFILE).
  final int index;

  /// Called with the tapped tab index. The parent owns state.
  final ValueChanged<int> onTap;

  static const _labels = <String>['TODAY', 'RECORD', 'PROFILE'];
  static const double _height = 80;
  static const double _indicatorInset = 16;
  static const double _indicatorThickness = 2;
  static const Duration _indicatorDuration = Duration(milliseconds: 120);

  @override
  Widget build(BuildContext context) {
    return Material(
      // Transparent Material ancestor silences any default ink splashes while
      // keeping standard text rendering for accessibility.
      color: ChaosColors.background,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: _height,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final tabWidth = constraints.maxWidth / _labels.length;
              final indicatorLeft = tabWidth * index + _indicatorInset;
              final indicatorWidth = (tabWidth - (_indicatorInset * 2)).clamp(
                0.0,
                double.infinity,
              );

              return Stack(
                children: [
                  // Hairline across the full width at the very top of the bar.
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 1,
                      child: ColoredBox(color: ChaosColors.grid),
                    ),
                  ),
                  // Animated amber active-tab indicator. Sits flush above the
                  // hairline (y = 0) so it visually "replaces" that segment.
                  AnimatedPositioned(
                    duration: _indicatorDuration,
                    curve: Curves.linear,
                    top: 0,
                    left: indicatorLeft,
                    width: indicatorWidth,
                    height: _indicatorThickness,
                    child: const ColoredBox(color: ChaosColors.amber),
                  ),
                  // Tab row.
                  Positioned.fill(
                    child: Row(
                      children: [
                        for (var i = 0; i < _labels.length; i++)
                          Expanded(
                            child: _TabItem(
                              label: _labels[i],
                              active: i == index,
                              onTap: () {
                                if (i == index) return;
                                HapticFeedback.selectionClick();
                                onTap(i);
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = active ? ChaosColors.amber : ChaosColors.textMuted;
    final labelStyle = ChaosTypography.label().copyWith(
      fontSize: 13,
      letterSpacing: 1.5,
      color: color,
    );
    final helperStyle = ChaosTypography.data().copyWith(
      fontSize: 11,
      color: color,
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: labelStyle),
          const SizedBox(height: 4),
          Text(active ? 'CURRENT TAB' : ' ', style: helperStyle),
        ],
      ),
    );
  }
}
