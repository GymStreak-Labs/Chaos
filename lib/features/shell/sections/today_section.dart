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
/// The solo strike dashboard: mission, ignition, action window, proof.
/// All values are mock for Stage 2A. Hooked up to real data in Stage 3.
class TodaySection extends StatefulWidget {
  const TodaySection({super.key});

  @override
  State<TodaySection> createState() => _TodaySectionState();
}

class _TodaySectionState extends State<TodaySection> {
  String _persona = 'CHAOS';
  String _mode = 'WAKE UP';
  String _mission = 'CALL DAD BACK';
  int _minutes = 2;
  bool _hasPlayedIgnition = false;

  static const _quickStarts = <_QuickStrike>[
    _QuickStrike(
      label: 'Send the message',
      mission: 'Send the message',
      minutes: 5,
      mode: 'reset',
      icon: Icons.send_rounded,
    ),
    _QuickStrike(
      label: 'Open the file',
      mission: 'Open the file and write one line',
      minutes: 5,
      mode: 'reset',
      icon: Icons.description_outlined,
    ),
    _QuickStrike(
      label: 'Start workout',
      mission: 'Start the workout',
      minutes: 20,
      mode: 'workout',
      icon: Icons.fitness_center_rounded,
    ),
    _QuickStrike(
      label: 'Clean for 5',
      mission: 'Clean one visible surface',
      minutes: 5,
      mode: 'reset',
      icon: Icons.cleaning_services_outlined,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final personaKey = prefs.getString(OnboardingPrefs.persona);
    final modeKey = prefs.getString(OnboardingPrefs.mode);
    final mission = prefs.getString(OnboardingPrefs.avoiding)?.trim();
    final minutes = prefs.getInt(OnboardingPrefs.strikeMinutes);
    final hasPlayedIgnition =
        prefs.getBool(OnboardingPrefs.hasPlayedIgnition) ?? false;
    if (!mounted) return;
    setState(() {
      _persona = _personaLabel(personaKey);
      _mode = _modeLabel(modeKey);
      _minutes = minutes ?? _defaultMinutesForMode(modeKey);
      _hasPlayedIgnition = hasPlayedIgnition;
      if (mission != null && mission.isNotEmpty) {
        _mission = mission.toUpperCase();
      }
    });
  }

  Future<void> _saveStrike({
    required String mission,
    required int minutes,
    String? mode,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(OnboardingPrefs.avoiding, mission);
    await prefs.setInt(OnboardingPrefs.strikeMinutes, minutes);
    if (mode != null) {
      await prefs.setString(OnboardingPrefs.mode, mode);
    }
    if (!mounted) return;
    setState(() {
      _mission = mission.toUpperCase();
      _minutes = minutes;
      if (mode != null) {
        _mode = _modeLabel(mode);
      }
    });
  }

  Future<void> _startInstantStrike() async {
    await _saveStrike(mission: _mission, minutes: 5, mode: 'reset');
    if (!mounted) return;
    context.go(ChaosRoutes.strike);
  }

  Future<void> _startCurrentStrike({required bool withIgnition}) async {
    await _saveStrike(mission: _mission, minutes: _minutes);
    if (!mounted) return;
    context.go(withIgnition ? ChaosRoutes.session : ChaosRoutes.strike);
  }

  Future<void> _startTemplate(_QuickStrike strike) async {
    await _saveStrike(
      mission: strike.mission,
      minutes: strike.minutes,
      mode: strike.mode,
    );
    if (!mounted) return;
    context.go(ChaosRoutes.strike);
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
          title: "TODAY'S MISSION",
          subtitle: 'Declare it. Ignite. Work the window. Prove it.',
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
                    const ChaosIconTile(icon: Icons.flag_outlined, size: 72),
                    const SizedBox(width: ChaosSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _mission,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: ChaosTypography.headline().copyWith(
                              fontSize: 26,
                            ),
                          ),
                          const SizedBox(height: ChaosSpacing.xs),
                          Text(
                            '$_mode · $_persona · $_minutes min',
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
                child: Column(
                  children: [
                    StencilButton(
                      label: 'START 5-MIN STRIKE',
                      leadingIcon: Icons.bolt_rounded,
                      trailing: '›',
                      expand: true,
                      filled: true,
                      height: 58,
                      onPressed: _startInstantStrike,
                    ),
                    const SizedBox(height: ChaosSpacing.sm),
                    Row(
                      children: [
                        Expanded(
                          child: StencilButton(
                            label: _hasPlayedIgnition
                                ? 'START SAVED STRIKE'
                                : 'PLAY IGNITION',
                            leadingIcon: _hasPlayedIgnition
                                ? Icons.flag_outlined
                                : Icons.volume_up_outlined,
                            expand: true,
                            height: 52,
                            onPressed: () => _startCurrentStrike(
                              withIgnition: !_hasPlayedIgnition,
                            ),
                          ),
                        ),
                        if (_hasPlayedIgnition) ...[
                          const SizedBox(width: ChaosSpacing.sm),
                          Expanded(
                            child: StencilButton(
                              label: 'IGNITION',
                              leadingIcon: Icons.volume_up_outlined,
                              expand: true,
                              height: 52,
                              onPressed: () =>
                                  _startCurrentStrike(withIgnition: true),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.md),
        ChaosCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChaosSectionLabel('Quick starts'),
              const SizedBox(height: ChaosSpacing.sm),
              Text(
                'No blank-page ritual. Pick the closest action and move.',
                style: ChaosTypography.body().copyWith(
                  color: ChaosColors.textMuted,
                ),
              ),
              const SizedBox(height: ChaosSpacing.md),
              for (final strike in _quickStarts) ...[
                _QuickStrikeTile(
                  strike: strike,
                  onTap: () => _startTemplate(strike),
                ),
                if (strike != _quickStarts.last)
                  const SizedBox(height: ChaosSpacing.sm),
              ],
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
        return 'WAKE UP';
      case 'lock_in':
        return 'LOCK IN';
      case 'workout':
        return 'WORKOUT';
      case 'reset':
        return 'RESET';
      default:
        return 'WAKE UP';
    }
  }

  int _defaultMinutesForMode(String? key) {
    switch (key) {
      case 'wake_up':
        return 2;
      case 'reset':
        return 5;
      case 'lock_in':
      case 'workout':
        return 20;
      default:
        return 2;
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

class _QuickStrike {
  const _QuickStrike({
    required this.label,
    required this.mission,
    required this.minutes,
    required this.mode,
    required this.icon,
  });

  final String label;
  final String mission;
  final int minutes;
  final String mode;
  final IconData icon;
}

class _QuickStrikeTile extends StatelessWidget {
  const _QuickStrikeTile({required this.strike, required this.onTap});

  final _QuickStrike strike;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      splashColor: Colors.transparent,
      highlightColor: ChaosColors.amber.withValues(alpha: 0.12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(ChaosSpacing.sm),
        decoration: BoxDecoration(
          color: ChaosColors.surfaceRaised,
          border: Border.all(color: ChaosColors.grid),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ChaosIconTile(
              icon: strike.icon,
              color: ChaosColors.textMuted,
              size: 42,
            ),
            const SizedBox(width: ChaosSpacing.md),
            Expanded(
              child: Text(
                strike.label.toUpperCase(),
                style: ChaosTypography.body().copyWith(
                  color: ChaosColors.text,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Text(
              '${strike.minutes} MIN',
              style: ChaosTypography.label().copyWith(
                color: ChaosColors.amber,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
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
                'Pick a hard thing. Start the strike.',
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
