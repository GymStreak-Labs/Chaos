import 'package:flutter/material.dart';

import '../../../design/components/ascii_box.dart';
import '../../../design/tokens.dart';
import '../mock_record.dart';

/// RECORD — the brutalist monospace streak readout.
///
/// All counters derived from [MockRecord]. Stage 3 replaces with
/// real session history.
class RecordSection extends StatelessWidget {
  const RecordSection({super.key});

  @override
  Widget build(BuildContext context) {
    final adherence = MockRecord.adherencePct;
    final gapStatus = adherence >= 75 ? 'CLOSING' : 'WIDENING';
    final yesterdayLine = MockRecord.yesterdayWon
        ? 'YESTERDAY: SHOWED UP.'
        : "YESTERDAY: DIDN'T.";

    return ListView(
      padding: const EdgeInsets.only(bottom: ChaosSpacing.xxl),
      children: [
        Text('FIELD RECORD', style: ChaosTypography.label()),
        const SizedBox(height: ChaosSpacing.xs),
        Text('ADHERENCE.', style: ChaosTypography.headline()),
        const SizedBox(height: ChaosSpacing.lg),
        AsciiBox(
          label: 'METRICS',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _pad('CURRENT STREAK', '${MockRecord.currentStreak}'),
                style: ChaosTypography.data(),
              ),
              Text(
                _pad('LONGEST STREAK', '${MockRecord.longestStreak}'),
                style: ChaosTypography.data(),
              ),
              Text(
                _pad('SHOWED UP',
                    '${MockRecord.showedUp}/${MockRecord.last30.length}'),
                style: ChaosTypography.data(),
              ),
              Text(
                _pad('MISSED', '${MockRecord.missed}'),
                style: ChaosTypography.data(),
              ),
              Text(
                _pad('ADHERENCE', '$adherence%'),
                style: ChaosTypography.data(),
              ),
              Text(
                _pad('GAP STATUS', gapStatus),
                style: ChaosTypography.data().copyWith(
                  color: gapStatus == 'CLOSING'
                      ? ChaosColors.amber
                      : ChaosColors.alert,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.lg),
        AsciiBox(
          label: 'LAST 30 DAYS',
          child: _MonthGrid(entries: MockRecord.last30),
        ),
        const SizedBox(height: ChaosSpacing.lg),
        Text(
          yesterdayLine,
          style: ChaosTypography.data().copyWith(
            color: ChaosColors.textMuted,
          ),
        ),
      ],
    );
  }

  String _pad(String key, String value) {
    const totalWidth = 28;
    final filler = (totalWidth - key.length - value.length).clamp(3, 99);
    return '$key ${'.' * filler} $value';
  }
}

class _MonthGrid extends StatelessWidget {
  const _MonthGrid({required this.entries});

  final List<bool?> entries;

  @override
  Widget build(BuildContext context) {
    // 5 rows of 6 columns = 30 glyphs.
    const columns = 6;
    const rows = 5;
    final glyphRows = <Widget>[];
    for (var r = 0; r < rows; r++) {
      final children = <InlineSpan>[];
      for (var c = 0; c < columns; c++) {
        final i = r * columns + c;
        final v = i < entries.length ? entries[i] : null;
        final glyph = switch (v) {
          true => '✓',
          false => '✗',
          null => '·',
        };
        final color = switch (v) {
          true => ChaosColors.amber,
          false => ChaosColors.alert,
          null => ChaosColors.textMuted,
        };
        children.add(
          TextSpan(
            text: glyph,
            style: ChaosTypography.dataLarge().copyWith(color: color),
          ),
        );
        if (c < columns - 1) {
          children.add(
            TextSpan(
              text: '  ',
              style: ChaosTypography.dataLarge(),
            ),
          );
        }
      }
      glyphRows.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text.rich(TextSpan(children: children)),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: glyphRows,
    );
  }
}
