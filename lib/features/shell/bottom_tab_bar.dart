import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../design/tokens.dart';

/// Concept-02 style bottom tab bar for [MainShell].
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

  static const _items = <_NavItem>[
    _NavItem('TODAY', Icons.gps_fixed_rounded),
    _NavItem('RECORD', Icons.bar_chart_rounded),
    _NavItem('PROFILE', Icons.person_outline_rounded),
  ];
  static const double _height = 78;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ChaosColors.background,
      child: SafeArea(
        top: false,
        child: Container(
          height: _height,
          decoration: const BoxDecoration(
            color: ChaosColors.background,
            border: Border(top: BorderSide(color: ChaosColors.border)),
          ),
          child: Row(
            children: [
              for (var i = 0; i < _items.length; i++)
                Expanded(
                  child: _TabItem(
                    item: _items[i],
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
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.item,
    required this.active,
    required this.onTap,
  });

  final _NavItem item;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = active ? ChaosColors.amber : ChaosColors.textMuted;
    final labelStyle = ChaosTypography.body().copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w700,
      color: color,
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, color: color, size: 24),
          const SizedBox(height: 5),
          Text(item.label, style: labelStyle),
        ],
      ),
    );
  }
}

class _NavItem {
  const _NavItem(this.label, this.icon);

  final String label;
  final IconData icon;
}
