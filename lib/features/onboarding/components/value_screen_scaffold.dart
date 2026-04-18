import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../design/components/grid_background.dart';
import '../../../design/components/stencil_button.dart';
import '../../../design/tokens.dart';

/// Reusable scaffold for "value" screens — the narrative beats between
/// inputs. Left-aligned, grid background, single CTA plus an optional
/// muted secondary link.
///
/// Value screens are not inputs. They reflect what the user just said
/// back at them in the brutalist-military voice.
class ValueScreenScaffold extends StatelessWidget {
  const ValueScreenScaffold({
    required this.title,
    required this.ctaLabel,
    required this.onContinue,
    this.label,
    this.body,
    this.footer,
    this.ctaFilled = false,
    this.secondaryLabel,
    this.onSecondary,
    super.key,
  });

  /// Amber stencil step / section label (e.g. "FACT 01 / 03").
  final String? label;

  /// Main headline. Caller passes a [Text] with display()/headline().
  final Widget title;

  /// Optional body block (monospace readout, AsciiBox, etc.).
  final Widget? body;

  /// Optional small footer above the CTA (e.g. "YES OR NO. NO THIRD OPTION.").
  final Widget? footer;

  /// Primary CTA label.
  final String ctaLabel;

  /// Primary CTA tap handler.
  final VoidCallback? onContinue;

  /// When true, primary CTA renders amber-filled (climactic beats only).
  final bool ctaFilled;

  /// Optional muted link rendered below the primary CTA.
  final String? secondaryLabel;

  final VoidCallback? onSecondary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(ChaosSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (label != null) ...[
                  Text(label!, style: ChaosTypography.label()),
                  const SizedBox(height: ChaosSpacing.md),
                ],
                const SizedBox(height: ChaosSpacing.md),
                DefaultTextStyle.merge(
                  style: ChaosTypography.headline(),
                  child: title,
                ),
                if (body != null) ...[
                  const SizedBox(height: ChaosSpacing.xl),
                  body!,
                ],
                const Spacer(),
                if (footer != null) ...[
                  footer!,
                  const SizedBox(height: ChaosSpacing.md),
                ],
                StencilButton(
                  label: ctaLabel,
                  trailing: '▸',
                  expand: true,
                  filled: ctaFilled,
                  onPressed: onContinue,
                ),
                if (secondaryLabel != null) ...[
                  const SizedBox(height: ChaosSpacing.md),
                  _SecondaryLink(
                    label: secondaryLabel!,
                    onTap: onSecondary,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SecondaryLink extends StatelessWidget {
  const _SecondaryLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: onTap == null
            ? null
            : () {
                HapticFeedback.selectionClick();
                onTap!();
              },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: ChaosSpacing.sm,
          ),
          child: Text(
            label.toUpperCase(),
            style: ChaosTypography.data().copyWith(
              color: ChaosColors.textMuted,
              decoration: TextDecoration.underline,
              decorationColor: ChaosColors.textMuted,
            ),
          ),
        ),
      ),
    );
  }
}
