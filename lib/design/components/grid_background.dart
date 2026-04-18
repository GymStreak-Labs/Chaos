import 'package:flutter/material.dart';

import '../tokens.dart';

/// Faint olive grid lines on matte black.
/// Tactical planning board / graph paper feel. No animation.
class GridBackground extends StatelessWidget {
  const GridBackground({required this.child, this.cellSize = 32, super.key});

  final Widget child;
  final double cellSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ChaosColors.background,
      child: CustomPaint(
        painter: _GridPainter(cellSize: cellSize),
        child: child,
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  _GridPainter({required this.cellSize});

  final double cellSize;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ChaosColors.grid
      ..strokeWidth = 1;

    for (double x = 0; x <= size.width; x += cellSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += cellSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) =>
      oldDelegate.cellSize != cellSize;
}
