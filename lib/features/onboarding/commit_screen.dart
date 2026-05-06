import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/router.dart';
import '../../design/components/ascii_box.dart';
import '../../design/tokens.dart';
import 'components/value_screen_scaffold.dart';
import 'onboarding_prefs.dart';

/// Final first-strike setup beat.
class CommitScreen extends StatefulWidget {
  const CommitScreen({super.key});

  @override
  State<CommitScreen> createState() => _CommitScreenState();
}

class _CommitScreenState extends State<CommitScreen> {
  String _mission = 'THE HARD THING';
  String _mode = 'WAKE UP';
  String _persona = 'DRILL SERGEANT';
  int _minutes = 2;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      final mission = prefs.getString(OnboardingPrefs.avoiding)?.trim();
      final modeKey = prefs.getString(OnboardingPrefs.mode);
      if (mission != null && mission.isNotEmpty) {
        _mission = mission.toUpperCase();
      }
      _mode = _modeName(modeKey);
      _persona = _personaName(prefs.getString(OnboardingPrefs.persona));
      _minutes =
          prefs.getInt(OnboardingPrefs.strikeMinutes) ??
          _defaultMinutesForMode(modeKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueScreenScaffold(
      label: 'READY.',
      subtitle: 'Your first strike is set. The app opens on this mission.',
      currentStep: 4,
      totalSteps: 4,
      backRoute: ChaosRoutes.onboardingPersona,
      title: Text('FIRST STRIKE\nIS READY.', style: ChaosTypography.headline()),
      body: AsciiBox(
        label: 'BRIEF',
        child: Text(
          'MISSION..... $_mission\n'
          'TYPE........ $_mode\n'
          'WINDOW...... $_minutes MIN\n'
          'VOICE....... $_persona\n'
          'PROOF....... DONE / FAILED',
          style: ChaosTypography.dataLarge(),
        ),
      ),
      ctaLabel: 'ENTER TODAY',
      ctaFilled: true,
      onContinue: () => context.go(ChaosRoutes.home),
      secondaryLabel: 'CHANGE MISSION',
      onSecondary: () => context.go(ChaosRoutes.onboardingAvoiding),
    );
  }

  String _modeName(String? key) {
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

  String _personaName(String? key) {
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
        return 'DRILL SERGEANT';
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
}
