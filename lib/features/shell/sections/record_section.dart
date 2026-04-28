import 'package:flutter/material.dart';

import '../../../design/components/chaos_card.dart';
import '../../../design/components/chaos_page_header.dart';
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
    return ListView(
      padding: const EdgeInsets.only(bottom: ChaosSpacing.xxl),
      children: [
        const ChaosPageHeader(
          eyebrow: 'RECORD',
          title: 'RECORD',
          subtitle: 'Truth in the numbers. No excuses in the data.',
        ),
        const SizedBox(height: ChaosSpacing.lg),
        ChaosCard(
          child: Row(
            children: [
              Expanded(
                child: _MetricBlock(
                  label: 'Current streak',
                  value: '${MockRecord.currentStreak}',
                  unit: 'days',
                ),
              ),
              SizedBox(
                width: 112,
                height: 112,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 104,
                      height: 104,
                      child: CircularProgressIndicator(
                        value: adherence / 100,
                        strokeWidth: 9,
                        backgroundColor: ChaosColors.surfaceRaised,
                        color: ChaosColors.amber,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '$adherence%',
                          style: ChaosTypography.headline().copyWith(
                            fontSize: 28,
                            color: ChaosColors.text,
                          ),
                        ),
                        Text(
                          'adherence',
                          style: ChaosTypography.body().copyWith(
                            color: ChaosColors.textMuted,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _MetricBlock(
                  label: 'Longest',
                  value: '${MockRecord.longestStreak}',
                  unit: 'days',
                  alignEnd: true,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.md),
        ChaosCard(
          padding: const EdgeInsets.all(ChaosSpacing.lg),
          backgroundColor: ChaosColors.surface,
          borderColor: ChaosColors.border,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChaosSectionLabel('Last 30 days'),
              const SizedBox(height: ChaosSpacing.md),
              _MonthGrid(entries: MockRecord.last30),
              const SizedBox(height: ChaosSpacing.md),
              Row(
                children: [
                  _LegendDot(color: ChaosColors.amber, label: 'Showed up'),
                  const SizedBox(width: ChaosSpacing.md),
                  _LegendDot(color: ChaosColors.alert, label: 'Missed'),
                  const SizedBox(width: ChaosSpacing.md),
                  _LegendDot(color: ChaosColors.textMuted, label: 'No data'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.md),
        ChaosCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChaosSectionLabel('Tier progression'),
              const SizedBox(height: ChaosSpacing.md),
              const _TierProgressRow(
                label: 'Recruit',
                active: true,
                requirement: 'You are here',
              ),
              const _TierProgressRow(
                label: 'Savage',
                requirement: '20 day streak',
              ),
              const _TierProgressRow(
                label: 'Legion',
                requirement: '50 day streak',
              ),
              const _TierProgressRow(
                label: 'Forged',
                requirement: '100 day streak',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MetricBlock extends StatelessWidget {
  const _MetricBlock({
    required this.label,
    required this.value,
    required this.unit,
    this.alignEnd = false,
  });

  final String label;
  final String value;
  final String unit;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignEnd
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          textAlign: alignEnd ? TextAlign.end : TextAlign.start,
          style: ChaosTypography.body().copyWith(
            color: ChaosColors.textMuted,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: ChaosSpacing.xs),
        Text(
          value,
          style: ChaosTypography.headline().copyWith(
            color: ChaosColors.amber,
            fontSize: 34,
          ),
        ),
        Text(
          unit.toUpperCase(),
          style: ChaosTypography.body().copyWith(
            color: ChaosColors.textMuted,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: ChaosSpacing.xs),
        Text(
          label,
          style: ChaosTypography.body().copyWith(
            color: ChaosColors.textMuted,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class _TierProgressRow extends StatelessWidget {
  const _TierProgressRow({
    required this.label,
    required this.requirement,
    this.active = false,
  });

  final String label;
  final String requirement;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active ? ChaosColors.amber : ChaosColors.textMuted;

    return Container(
      margin: const EdgeInsets.only(bottom: ChaosSpacing.sm),
      padding: const EdgeInsets.all(ChaosSpacing.md),
      decoration: BoxDecoration(
        color: active
            ? ChaosColors.amber.withValues(alpha: 0.08)
            : Colors.transparent,
        border: Border.all(
          color: active ? ChaosColors.amber : ChaosColors.border,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.keyboard_double_arrow_up_rounded, color: color, size: 26),
          const SizedBox(width: ChaosSpacing.md),
          Expanded(
            child: Text(
              label.toUpperCase(),
              style: ChaosTypography.label().copyWith(
                color: active ? ChaosColors.text : ChaosColors.textMuted,
              ),
            ),
          ),
          Text(
            requirement.toUpperCase(),
            style: ChaosTypography.body().copyWith(
              color: active ? ChaosColors.amber : ChaosColors.textMuted,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _MonthGrid extends StatelessWidget {
  const _MonthGrid({required this.entries});

  final List<bool?> entries;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [for (final v in entries) _DayMark(value: v)],
    );
  }
}

class _DayMark extends StatelessWidget {
  const _DayMark({required this.value});

  final bool? value;

  @override
  Widget build(BuildContext context) {
    final icon = switch (value) {
      true => Icons.check_rounded,
      false => Icons.close_rounded,
      null => null,
    };
    final color = switch (value) {
      true => ChaosColors.amber,
      false => ChaosColors.alert,
      null => ChaosColors.textMuted,
    };

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color),
      ),
      child: icon == null ? null : Icon(icon, color: color, size: 15),
    );
  }
}
