import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/router.dart';
import '../../../design/components/ascii_box.dart';
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
        Text(dateStr, style: ChaosTypography.label()),
        const SizedBox(height: ChaosSpacing.xs),
        Text(
          'DAY $day OF OPERATION',
          style: ChaosTypography.headline(),
        ),
        const SizedBox(height: ChaosSpacing.lg),
        AsciiBox(
          label: "TODAY'S BRIEF",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_pad('MODE', _mode), style: ChaosTypography.data()),
              Text(_pad('PERSONA', _persona), style: ChaosTypography.data()),
              Text(_pad('LENGTH', '7 MIN'), style: ChaosTypography.data()),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.xl),
        StencilButton(
          label: 'LOCK IN',
          trailing: '▸',
          expand: true,
          filled: true,
          height: 140,
          onPressed: () => context.go(ChaosRoutes.session),
        ),
        const SizedBox(height: ChaosSpacing.xl),
        AsciiBox(
          label: 'LAST SESSION',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '17 APR · DAY ${(day - 1).clamp(0, 999)}',
                style: ChaosTypography.data(),
              ),
              Text(
                _pad('VERDICT', yesterdayWon ? 'YES' : 'NO'),
                style: ChaosTypography.data().copyWith(
                  color: yesterdayWon
                      ? ChaosColors.amber
                      : ChaosColors.alert,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.lg),
        StencilButton(
          label: 'REGENERATE',
          expand: true,
          onPressed: () {
            // Stage 3 will hook this to the generation pipeline.
            debugPrint('REGENERATE tapped — stubbed in Stage 2A.');
          },
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

  /// Monospace label/value row: `KEY ......... VALUE` (total width 28).
  String _pad(String key, String value) {
    const totalWidth = 28;
    final filler = (totalWidth - key.length - value.length).clamp(3, 99);
    return '$key ${'.' * filler} $value';
  }

  String _formatDate(DateTime d) {
    const months = [
      'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
      'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC',
    ];
    final dd = d.day.toString().padLeft(2, '0');
    return '$dd ${months[d.month - 1]} ${d.year}';
  }
}
