import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/router.dart';
import '../../../design/components/chaos_card.dart';
import '../../../design/components/chaos_page_header.dart';
import '../../../design/components/stencil_button.dart';
import '../../../design/tokens.dart';
import '../../onboarding/onboarding_prefs.dart';
import '../mock_record.dart';

/// TODAY — the default landing section.
///
/// Mirrors the "Morning Brief" pattern from roadmap §2:
///   DATE · DAY N OF OPERATION · TODAY'S BRIEF · LOCK IN · LAST SESSION.
/// All values are mock for Stage 2A. Hooked up to real data in Stage 3.
class TodaySection extends StatefulWidget {
  const TodaySection({super.key});

  @override
  State<TodaySection> createState() => _TodaySectionState();
}

class _TodaySectionState extends State<TodaySection> {
  String _persona = 'CHAOS';
  String _mode = 'RAGE-UP';

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final personaKey = prefs.getString(OnboardingPrefs.persona);
    final modeKey = prefs.getString(OnboardingPrefs.mode);
    if (!mounted) return;
    setState(() {
      _persona = _personaLabel(personaKey);
      _mode = _modeLabel(modeKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dateStr = _formatDate(DateTime.now());
    final day = MockRecord.currentStreak;
    final yesterdayWon = MockRecord.yesterdayWon;

    return ListView(
      padding: const EdgeInsets.only(bottom: ChaosSpacing.xxl),
      children: [
        _AppHeader(dateStr: dateStr),
        const SizedBox(height: ChaosSpacing.lg),
        ChaosPageHeader(
          eyebrow: 'TODAY',
          title: 'LOCK-IN SESSION',
          subtitle: 'Drill Sergeant. 20 min. Focus, execute, finish strong.',
        ),
        const SizedBox(height: ChaosSpacing.lg),
        ChaosCard(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(ChaosSpacing.md),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ChaosIconTile(
                      icon: Icons.graphic_eq_rounded,
                      size: 72,
                    ),
                    const SizedBox(width: ChaosSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _mode,
                            style: ChaosTypography.label().copyWith(
                              color: ChaosColors.text,
                            ),
                          ),
                          const SizedBox(height: ChaosSpacing.xs),
                          Text(
                            _persona,
                            style: ChaosTypography.body().copyWith(
                              color: ChaosColors.textMuted,
                            ),
                          ),
                          const SizedBox(height: ChaosSpacing.xs),
                          Text(
                            '20 min',
                            style: ChaosTypography.body().copyWith(
                              color: ChaosColors.textMuted,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: ChaosColors.textMuted,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  ChaosSpacing.md,
                  0,
                  ChaosSpacing.md,
                  ChaosSpacing.md,
                ),
                child: StencilButton(
                  label: 'START SESSION',
                  leadingIcon: Icons.play_arrow_rounded,
                  trailing: '›',
                  expand: true,
                  filled: true,
                  height: 58,
                  onPressed: () => context.go(ChaosRoutes.session),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.md),
        ChaosCard(
          child: Row(
            children: [
              const ChaosIconTile(icon: Icons.local_fire_department_rounded),
              const SizedBox(width: ChaosSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$day DAY STREAK',
                      style: ChaosTypography.headline().copyWith(fontSize: 30),
                    ),
                    Text(
                      'Keep it going. Consistency builds who you are.',
                      style: ChaosTypography.body().copyWith(
                        color: ChaosColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: ChaosColors.textMuted,
              ),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.md),
        ChaosCard(
          child: Row(
            children: [
              Icon(
                yesterdayWon
                    ? Icons.check_circle_outline_rounded
                    : Icons.cancel_outlined,
                color: yesterdayWon ? ChaosColors.text : ChaosColors.alert,
                size: 36,
              ),
              const SizedBox(width: ChaosSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last check-in',
                      style: ChaosTypography.label().copyWith(
                        color: ChaosColors.text,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: ChaosSpacing.xs),
                    Text(
                      yesterdayWon
                          ? 'You showed up. That is what matters.'
                          : "You didn't. Start again today.",
                      style: ChaosTypography.body().copyWith(
                        color: ChaosColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                yesterdayWon ? 'YES' : 'NO',
                style: ChaosTypography.label().copyWith(
                  color: yesterdayWon ? ChaosColors.amber : ChaosColors.alert,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.md),
        ChaosCard(
          child: Row(
            children: [
              const ChaosIconTile(
                icon: Icons.lock_outline_rounded,
                color: ChaosColors.textMuted,
              ),
              const SizedBox(width: ChaosSpacing.md),
              Expanded(
                child: Text(
                  'Earned peace is the reward. Not the goal.',
                  style: ChaosTypography.body().copyWith(
                    color: ChaosColors.textMuted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _personaLabel(String? key) {
    switch (key) {
      case 'drill_sergeant':
        return 'DRILL SERGEANT';
      case 'cold_mentor':
        return 'COLD MENTOR';
      case 'street_general':
        return 'STREET GENERAL';
      case 'the_monk':
        return 'THE MONK';
      default:
        return 'CHAOS';
    }
  }

  String _modeLabel(String? key) {
    switch (key) {
      case 'wake_up':
        return 'RAGE-UP';
      case 'lock_in':
        return 'LOCK-IN';
      case 'workout':
        return 'PRE-WORKOUT';
      case 'reset':
        return 'RESET';
      default:
        return 'RAGE-UP';
    }
  }

  String _formatDate(DateTime d) {
    const months = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC',
    ];
    final dd = d.day.toString().padLeft(2, '0');
    return '$dd ${months[d.month - 1]} ${d.year}';
  }
}

class _AppHeader extends StatelessWidget {
  const _AppHeader({required this.dateStr});

  final String dateStr;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CHAOS',
                style: ChaosTypography.headline().copyWith(
                  color: ChaosColors.amber,
                  fontSize: 34,
                ),
              ),
              Text(
                'Anti-calm. Output over feelings.',
                style: ChaosTypography.body().copyWith(
                  color: ChaosColors.textMuted,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(
              Icons.settings_outlined,
              color: ChaosColors.textMuted,
              size: 22,
            ),
            const SizedBox(height: ChaosSpacing.sm),
            Text(
              dateStr,
              style: ChaosTypography.body().copyWith(
                color: ChaosColors.textMuted,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
