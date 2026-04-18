import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/router.dart';
import '../../design/tokens.dart';
import 'components/value_screen_scaffold.dart';
import 'duration_screen.dart';
import 'onboarding_prefs.dart';

/// Act 2 — Screen 09. Massive stencil day count. Gut-punch reflection.
class DurationReflectionScreen extends StatefulWidget {
  const DurationReflectionScreen({super.key});

  @override
  State<DurationReflectionScreen> createState() =>
      _DurationReflectionScreenState();
}

class _DurationReflectionScreenState extends State<DurationReflectionScreen> {
  AvoidanceDuration? _duration;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(OnboardingPrefs.duration);
    if (!mounted) return;
    setState(() => _duration = AvoidanceDuration.fromName(raw));
  }

  @override
  Widget build(BuildContext context) {
    final d = _duration;
    final isLostCount = d == AvoidanceDuration.lostCount;

    final Widget headline;
    if (d == null) {
      headline = Text('— DAYS.', style: ChaosTypography.display());
    } else if (isLostCount) {
      headline = Text(
        'TOO MANY\nTO COUNT.',
        style: ChaosTypography.display().copyWith(fontSize: 72),
      );
    } else {
      headline = Text(
        '${d.approximateDays} DAYS.',
        style: ChaosTypography.display().copyWith(fontSize: 72),
      );
    }

    return ValueScreenScaffold(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headline,
          const SizedBox(height: ChaosSpacing.lg),
          Text(
            'GONE.\nNOT COMING BACK.',
            style: ChaosTypography.headline().copyWith(
              color: ChaosColors.amber,
            ),
          ),
        ],
      ),
      ctaLabel: 'CONTINUE',
      onContinue: () => context.go(ChaosRoutes.lie),
    );
  }
}
