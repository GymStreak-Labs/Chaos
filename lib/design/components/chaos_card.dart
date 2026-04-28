import 'package:flutter/material.dart';

import '../tokens.dart';

class ChaosCard extends StatelessWidget {
  const ChaosCard({
    required this.child,
    this.padding = const EdgeInsets.all(ChaosSpacing.md),
    this.borderColor = ChaosColors.border,
    this.backgroundColor = ChaosColors.surface,
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsets padding;
  final Color borderColor;
  final Color backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = AnimatedContainer(
      duration: const Duration(milliseconds: 140),
      curve: Curves.easeOut,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );

    if (onTap == null) return content;

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      splashColor: Colors.transparent,
      highlightColor: const Color(0x22E59B16),
      onTap: onTap,
      child: content,
    );
  }
}

class ChaosSectionLabel extends StatelessWidget {
  const ChaosSectionLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: ChaosTypography.label().copyWith(
        fontSize: 14,
        color: ChaosColors.text,
      ),
    );
  }
}

class ChaosIconTile extends StatelessWidget {
  const ChaosIconTile({
    required this.icon,
    this.color = ChaosColors.amber,
    this.size = 48,
    super.key,
  });

  final IconData icon;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        border: Border.all(color: color.withValues(alpha: 0.55)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: color, size: size * 0.46),
    );
  }
}
