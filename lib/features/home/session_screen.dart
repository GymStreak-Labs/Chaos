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

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  int _minutes = 20;
  String _persona = 'DRILL SERGEANT';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final minutes = prefs.getInt(OnboardingPrefs.strikeMinutes);
    final persona = _personaName(prefs.getString(OnboardingPrefs.persona));
    if (!mounted) return;
    setState(() {
      _minutes = minutes ?? 20;
      _persona = persona;
    });
  }

  Future<void> _startStrike() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(OnboardingPrefs.hasPlayedIgnition, true);
    if (!mounted) return;
    context.go(ChaosRoutes.strike);
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
                  eyebrow: 'IGNITION',
                  title: _persona,
                  subtitle:
                      'A short voice hit. Useful once. Optional after that.',
                  onBack: () => context.go(ChaosRoutes.home),
                ),
                const SizedBox(height: ChaosSpacing.md),
                ChaosCard(
                  padding: const EdgeInsets.all(ChaosSpacing.md),
                  child: Column(
                    children: [
                      Text(
                        'SHORT IGNITION',
                        style: ChaosTypography.label().copyWith(
                          color: ChaosColors.text,
                        ),
                      ),
                      const SizedBox(height: ChaosSpacing.sm),
                      SizedBox(
                        width: 140,
                        height: 140,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 128,
                              height: 128,
                              child: CircularProgressIndicator(
                                value: 0.42,
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
                                  '02:18',
                                  style: ChaosTypography.headline().copyWith(
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  'OF 03:00',
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
                      const SizedBox(height: ChaosSpacing.sm),
                      const _Waveform(),
                      const SizedBox(height: ChaosSpacing.sm),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _RoundControl(
                            icon: Icons.replay_10_rounded,
                            onTap: () {},
                          ),
                          _RoundControl(
                            icon: Icons.pause_rounded,
                            primary: true,
                            onTap: () {},
                          ),
                          _RoundControl(
                            icon: Icons.forward_10_rounded,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: ChaosSpacing.lg),
                Text(
                  'Now move.',
                  style: ChaosTypography.headline().copyWith(fontSize: 32),
                ),
                const SizedBox(height: ChaosSpacing.sm),
                Text(
                  'Listening is ignition. The strike window is where the work happens.',
                  style: ChaosTypography.body().copyWith(
                    color: ChaosColors.textMuted,
                  ),
                ),
                const SizedBox(height: ChaosSpacing.md),
                StencilButton(
                  label: 'START $_minutes-MIN STRIKE',
                  trailing: '›',
                  expand: true,
                  filled: true,
                  height: 58,
                  leadingIcon: Icons.flag_outlined,
                  onPressed: _startStrike,
                ),
                const SizedBox(height: ChaosSpacing.sm),
                StencilButton(
                  label: 'SKIP IGNITION',
                  expand: true,
                  height: 54,
                  leadingIcon: Icons.fast_forward_rounded,
                  onPressed: () => context.go(ChaosRoutes.strike),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Waveform extends StatelessWidget {
  const _Waveform();

  @override
  Widget build(BuildContext context) {
    const heights = [
      14.0,
      28.0,
      18.0,
      36.0,
      24.0,
      44.0,
      30.0,
      20.0,
      34.0,
      16.0,
      26.0,
      40.0,
      22.0,
      30.0,
      18.0,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var i = 0; i < heights.length; i++) ...[
          Container(
            width: 4,
            height: heights[i],
            decoration: BoxDecoration(
              color: i < 9 ? ChaosColors.amber : ChaosColors.border,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          if (i < heights.length - 1) const SizedBox(width: 5),
        ],
      ],
    );
  }
}

class _RoundControl extends StatelessWidget {
  const _RoundControl({
    required this.icon,
    required this.onTap,
    this.primary = false,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final size = primary ? 64.0 : 46.0;
    final color = primary ? ChaosColors.text : ChaosColors.textMuted;

    return InkWell(
      borderRadius: BorderRadius.circular(size / 2),
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: primary ? ChaosColors.text : ChaosColors.border,
          ),
          color: primary ? ChaosColors.surfaceRaised : Colors.transparent,
        ),
        child: Icon(icon, color: color, size: primary ? 34 : 24),
      ),
    );
  }
}
