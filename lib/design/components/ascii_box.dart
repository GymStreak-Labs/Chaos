import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../tokens.dart';

/// Renders a double-line ASCII border around [child] using monospace text.
/// Corners: ╔ ╗ ╚ ╝. Sides: ║ ═.
/// Used for Morning Brief / Evening Debrief blocks.
class AsciiBox extends StatelessWidget {
  const AsciiBox({
    required this.child,
    this.label,
    this.padding = const EdgeInsets.all(ChaosSpacing.md),
    this.borderColor = ChaosColors.amber,
    super.key,
  });

  final Widget child;
  final String? label;
  final EdgeInsets padding;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final borderStyle = GoogleFonts.shareTechMono(
      fontSize: 14,
      height: 1.0,
      letterSpacing: 0,
      color: borderColor,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        // Approximate monospace glyph width for 14pt Share Tech Mono.
        const glyphWidth = 8.4;
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.of(context).size.width;
        final interiorCount = ((width / glyphWidth).floor() - 2).clamp(2, 500);
        final top = _buildEdge('╔', '╗', interiorCount, label);
        final bottom = _buildEdge('╚', '╝', interiorCount, null);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(top, style: borderStyle, maxLines: 1, softWrap: false),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('║', style: borderStyle),
                  Expanded(
                    child: Padding(
                      padding: padding,
                      child: child,
                    ),
                  ),
                  Text('║', style: borderStyle),
                ],
              ),
            ),
            Text(bottom, style: borderStyle, maxLines: 1, softWrap: false),
          ],
        );
      },
    );
  }

  String _buildEdge(String left, String right, int interiorCount, String? label) {
    if (label == null || label.isEmpty) {
      return '$left${'═' * interiorCount}$right';
    }
    // Embed label as: ╔═[ LABEL ]═══════════╗
    final tag = '[ ${label.toUpperCase()} ]';
    if (tag.length + 4 >= interiorCount) {
      return '$left${'═' * interiorCount}$right';
    }
    final remaining = interiorCount - tag.length - 1; // 1 for leading ═
    return '$left═$tag${'═' * remaining}$right';
  }
}
