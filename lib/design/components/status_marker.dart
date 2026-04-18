import 'package:flutter/material.dart';

import '../tokens.dart';

enum StatusMarkerState { active, incomplete, failed }

/// Renders `[■ ACTIVE]` / `[□ INCOMPLETE]` / `[✗ FAILED]`.
class StatusMarker extends StatelessWidget {
  const StatusMarker({required this.state, this.labelOverride, super.key});

  final StatusMarkerState state;
  final String? labelOverride;

  @override
  Widget build(BuildContext context) {
    final glyph = switch (state) {
      StatusMarkerState.active => '■',
      StatusMarkerState.incomplete => '□',
      StatusMarkerState.failed => '✗',
    };
    final label =
        labelOverride ??
        switch (state) {
          StatusMarkerState.active => 'ACTIVE',
          StatusMarkerState.incomplete => 'INCOMPLETE',
          StatusMarkerState.failed => 'FAILED',
        };
    final color = switch (state) {
      StatusMarkerState.active => ChaosColors.amber,
      StatusMarkerState.incomplete => ChaosColors.textMuted,
      StatusMarkerState.failed => ChaosColors.alert,
    };

    return Text(
      '[$glyph $label]',
      style: ChaosTypography.data().copyWith(color: color),
    );
  }
}
