import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/router.dart';
import '../../design/components/ascii_box.dart';
import '../../design/tokens.dart';
import 'components/value_screen_scaffold.dart';
import 'onboarding_prefs.dart';

/// Each persona gets a one-shot bio block.
class _PersonaBio {
  const _PersonaBio({required this.name, required this.bio});
  final String name;
  final String bio;
}

const _personaBios = <String, _PersonaBio>{
  'drill_sergeant': _PersonaBio(
    name: 'DRILL SERGEANT',
    bio: 'HE DOES NOT CARE ABOUT\n'
        'YOUR FEELINGS.\n\n'
        'HE CARES ABOUT\n'
        'WHETHER YOU SHOWED UP.',
  ),
  'cold_mentor': _PersonaBio(
    name: 'COLD MENTOR',
    bio: 'SHE WILL NOT RAISE HER VOICE.\n\n'
        'SHE WILL MAKE YOU\n'
        'UNCOMFORTABLE\n'
        'WITH THE TRUTH.',
  ),
  'street_general': _PersonaBio(
    name: 'STREET GENERAL',
    bio: "HE'S BEEN WHERE YOU ARE.\n\n"
        'HE GOT OUT.\n\n'
        "HE'LL DRAG YOU WITH HIM.",
  ),
};

/// Act 3 — Screen 13. Personalised persona bio card.
class PersonaIntroScreen extends StatefulWidget {
  const PersonaIntroScreen({super.key});

  @override
  State<PersonaIntroScreen> createState() => _PersonaIntroScreenState();
}

class _PersonaIntroScreenState extends State<PersonaIntroScreen> {
  _PersonaBio? _bio;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final key = prefs.getString(OnboardingPrefs.persona);
    if (!mounted) return;
    setState(() {
      _bio = _personaBios[key] ??
          const _PersonaBio(
            name: 'YOUR VOICE',
            bio: 'READY TO GO.',
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final bio = _bio;

    return ValueScreenScaffold(
      label: 'VOICE LOCKED.',
      title: Text(
        bio?.name ?? '—',
        style: ChaosTypography.headline().copyWith(
          color: ChaosColors.amber,
        ),
      ),
      body: bio == null
          ? const SizedBox.shrink()
          : AsciiBox(
              label: 'BIO',
              child: Text(
                bio.bio,
                style: ChaosTypography.dataLarge(),
              ),
            ),
      ctaLabel: 'CONTINUE',
      onContinue: () => context.go(ChaosRoutes.onboardingMode),
    );
  }
}
