import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/router.dart';
import '../../design/components/grid_background.dart';
import '../../design/components/stencil_button.dart';
import '../../design/tokens.dart';
import 'onboarding_prefs.dart';

/// Human-facing persona name for the copy line.
const _personaDisplayNames = <String, String>{
  'drill_sergeant': 'DRILL SERGEANT',
  'cold_mentor': 'COLD MENTOR',
  'street_general': 'STREET GENERAL',
};

/// Act 3 — Screen 16. System-prompt style notifications ask.
/// NOTE: does not actually call the iOS/Android permission API — Stage 3+.
/// Stores only `'granted'` or `'declined'` in prefs.
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String _personaName = 'CHAOS';

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
      _personaName = _personaDisplayNames[key] ?? 'CHAOS';
    });
  }

  Future<void> _record(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(OnboardingPrefs.notifications, value);
    if (!mounted) return;
    context.go(ChaosRoutes.cadence);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(ChaosSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('STEP 06 / 06', style: ChaosTypography.label()),
                const SizedBox(height: ChaosSpacing.sm),
                Text(
                  '$_personaName NEEDS\nTO REACH YOU.',
                  style: ChaosTypography.headline(),
                ),
                const SizedBox(height: ChaosSpacing.md),
                Text(
                  "OR YOU WON'T HEAR\nFROM HIM. WHICH DEFEATS\nTHE WHOLE POINT.",
                  style: ChaosTypography.data().copyWith(
                    color: ChaosColors.textMuted,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                StencilButton(
                  label: 'ALLOW NOTIFICATIONS',
                  trailing: '▸',
                  expand: true,
                  filled: true,
                  onPressed: () => _record('granted'),
                ),
                const SizedBox(height: ChaosSpacing.md),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () => _record('declined'),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: ChaosSpacing.sm,
                      ),
                      child: Text(
                        'DESERTER',
                        style: ChaosTypography.data().copyWith(
                          color: ChaosColors.textMuted,
                          decoration: TextDecoration.underline,
                          decorationColor: ChaosColors.textMuted,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
