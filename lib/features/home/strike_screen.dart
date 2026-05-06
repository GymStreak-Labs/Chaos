import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/router.dart';
import '../../design/components/chaos_card.dart';
import '../../design/components/chaos_page_header.dart';
import '../../design/components/grid_background.dart';
import '../../design/components/stencil_button.dart';
import '../../design/tokens.dart';
import '../onboarding/onboarding_prefs.dart';

/// The missing bridge between listening and action.
///
/// Audio is not victory. The strike window turns the pressure hit into a
/// concrete commitment, then routes into binary proof.
class StrikeScreen extends StatefulWidget {
  const StrikeScreen({super.key});

  @override
  State<StrikeScreen> createState() => _StrikeScreenState();
}

class _StrikeScreenState extends State<StrikeScreen> {
  String _mission = 'CALL DAD BACK';
  int _minutes = 20;

  @override
  void initState() {
    super.initState();
    _loadMission();
  }

  Future<void> _loadMission() async {
    final prefs = await SharedPreferences.getInstance();
    final mission = prefs.getString(OnboardingPrefs.avoiding)?.trim();
    final minutes = prefs.getInt(OnboardingPrefs.strikeMinutes);
    if (!mounted) return;
    setState(() {
      if (mission != null && mission.isNotEmpty) {
        _mission = mission.toUpperCase();
      }
      if (minutes != null) {
        _minutes = minutes;
      }
    });
  }

  Future<void> _addFive() async {
    final nextMinutes = _minutes + 5;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(OnboardingPrefs.strikeMinutes, nextMinutes);
    if (!mounted) return;
    setState(() => _minutes = nextMinutes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(ChaosSpacing.lg),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ChaosPageHeader(
                  eyebrow: 'STRIKE',
                  title: 'NOW DO THE THING',
                  subtitle:
                      'The audio was the ignition. This is the work window.',
                  onBack: () => context.go(ChaosRoutes.session),
                ),
                const SizedBox(height: ChaosSpacing.lg),
                ChaosCard(
                  borderColor: ChaosColors.amber,
                  backgroundColor: ChaosColors.amber.withValues(alpha: 0.08),
                  child: Row(
                    children: [
                      const ChaosIconTile(icon: Icons.flag_outlined, size: 52),
                      const SizedBox(width: ChaosSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TARGET',
                              style: ChaosTypography.label().copyWith(
                                color: ChaosColors.amber,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: ChaosSpacing.xs),
                            Text(
                              _mission,
                              style: ChaosTypography.headline().copyWith(
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: ChaosSpacing.lg),
                ChaosCard(
                  padding: const EdgeInsets.all(ChaosSpacing.lg),
                  child: Column(
                    children: [
                      Text(
                        'ACTION WINDOW',
                        style: ChaosTypography.label().copyWith(
                          color: ChaosColors.text,
                        ),
                      ),
                      const SizedBox(height: ChaosSpacing.lg),
                      SizedBox(
                        width: 166,
                        height: 166,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 154,
                              height: 154,
                              child: CircularProgressIndicator(
                                value: 1,
                                strokeWidth: 12,
                                backgroundColor: ChaosColors.surfaceRaised,
                                color: ChaosColors.amber,
                                strokeCap: StrokeCap.round,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '$_minutes:00',
                                  style: ChaosTypography.headline().copyWith(
                                    fontSize: 42,
                                  ),
                                ),
                                Text(
                                  'NO DRIFT',
                                  style: ChaosTypography.body().copyWith(
                                    color: ChaosColors.textMuted,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: ChaosSpacing.md),
                      Text(
                        'When the window ends, submit proof. Listening does not count. Action counts.',
                        textAlign: TextAlign.center,
                        style: ChaosTypography.body().copyWith(
                          color: ChaosColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: ChaosSpacing.lg),
                Row(
                  children: [
                    Expanded(
                      child: StencilButton(
                        label: 'I DID IT',
                        expand: true,
                        filled: true,
                        height: 58,
                        leadingIcon: Icons.check_rounded,
                        onPressed: () => context.go(ChaosRoutes.home),
                      ),
                    ),
                    const SizedBox(width: ChaosSpacing.sm),
                    Expanded(
                      child: StencilButton(
                        label: 'I FAILED',
                        expand: true,
                        height: 58,
                        accentColor: ChaosColors.alert,
                        leadingIcon: Icons.close_rounded,
                        onPressed: () => context.go(ChaosRoutes.streakBreak),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: ChaosSpacing.sm),
                StencilButton(
                  label: 'ADD 5 MIN',
                  expand: true,
                  height: 54,
                  leadingIcon: Icons.add_rounded,
                  onPressed: _addFive,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
