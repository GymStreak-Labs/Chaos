import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/router.dart';
import '../../design/components/ascii_box.dart';
import '../../design/tokens.dart';
import 'components/value_screen_scaffold.dart';
import 'onboarding_prefs.dart';

/// Act 2 — Screen 11. Echoes the user's own lie back at them in a log box.
class LieReflectionScreen extends StatefulWidget {
  const LieReflectionScreen({super.key});

  @override
  State<LieReflectionScreen> createState() => _LieReflectionScreenState();
}

class _LieReflectionScreenState extends State<LieReflectionScreen> {
  String? _lie;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() => _lie = prefs.getString(OnboardingPrefs.lie));
  }

  @override
  Widget build(BuildContext context) {
    final echo = (_lie ?? '').toUpperCase();

    return ValueScreenScaffold(
      title: Text(
        'ON THE RECORD.',
        style: ChaosTypography.headline(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AsciiBox(
            label: 'LOG',
            child: Text(
              '"$echo"',
              style: ChaosTypography.dataLarge(),
            ),
          ),
          const SizedBox(height: ChaosSpacing.xl),
          Text(
            "YOU'VE SAID THAT A LOT.",
            style: ChaosTypography.headline().copyWith(
              color: ChaosColors.amber,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: ChaosSpacing.md),
          Text(
            "WE'RE GOING TO MAKE IT\nTHE LAST TIME.",
            style: ChaosTypography.data().copyWith(
              color: ChaosColors.textMuted,
              fontSize: 16,
            ),
          ),
        ],
      ),
      ctaLabel: 'LOCK IT IN',
      onContinue: () => context.go(ChaosRoutes.onboardingPersona),
    );
  }
}
