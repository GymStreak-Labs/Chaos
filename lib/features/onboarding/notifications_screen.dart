import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/router.dart';
import '../../design/components/chaos_card.dart';
import '../../design/components/chaos_page_header.dart';
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
                ChaosPageHeader(
                  eyebrow: 'ASSIGNMENT',
                  title: 'STAY ACCOUNTABLE',
                  subtitle:
                      'Let $_personaName reach you when it is time to show up.',
                  currentStep: 5,
                  totalSteps: 6,
                  onBack: () => context.go(ChaosRoutes.deal),
                ),
                const SizedBox(height: ChaosSpacing.xl),
                Center(
                  child: Container(
                    width: 132,
                    height: 132,
                    decoration: BoxDecoration(
                      color: ChaosColors.amber.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                      border: Border.all(color: ChaosColors.amber),
                    ),
                    child: const Icon(
                      Icons.notifications_active_outlined,
                      color: ChaosColors.amber,
                      size: 68,
                    ),
                  ),
                ),
                const SizedBox(height: ChaosSpacing.xl),
                const ChaosCard(
                  child: Column(
                    children: [
                      _ReminderFeature(
                        icon: Icons.schedule_rounded,
                        title: 'Smart reminders',
                        subtitle: 'Right time. Right pressure.',
                      ),
                      SizedBox(height: ChaosSpacing.md),
                      _ReminderFeature(
                        icon: Icons.shield_outlined,
                        title: 'Streak protection',
                        subtitle: 'Never miss a day by accident.',
                      ),
                      SizedBox(height: ChaosSpacing.md),
                      _ReminderFeature(
                        icon: Icons.check_circle_outline_rounded,
                        title: 'No excuses',
                        subtitle: 'You chose this. Now lock it in.',
                      ),
                    ],
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
                  child: TextButton(
                    onPressed: () => _record('declined'),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      foregroundColor: ChaosColors.textMuted,
                    ),
                    child: Text(
                      'SKIP FOR NOW',
                      style: ChaosTypography.data().copyWith(
                        color: ChaosColors.textMuted,
                        decoration: TextDecoration.underline,
                        decorationColor: ChaosColors.textMuted,
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

class _ReminderFeature extends StatelessWidget {
  const _ReminderFeature({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChaosIconTile(icon: icon, size: 42),
        const SizedBox(width: ChaosSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toUpperCase(),
                style: ChaosTypography.label().copyWith(
                  color: ChaosColors.text,
                  fontSize: 13,
                ),
              ),
              Text(
                subtitle,
                style: ChaosTypography.body().copyWith(
                  color: ChaosColors.textMuted,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.check_circle_rounded,
          color: ChaosColors.amber,
          size: 20,
        ),
      ],
    );
  }
}
