import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/router.dart';
import '../../design/components/grid_background.dart';
import '../../design/components/option_row.dart';
import '../../design/components/stencil_button.dart';
import '../../design/tokens.dart';
import 'onboarding_prefs.dart';

/// Durations that map to a rough "days" number for the reflection screen.
/// Mid-point approximations — not presented as precise data, just a gut punch.
enum AvoidanceDuration {
  oneWeek(label: '1 WEEK', approximateDays: 7),
  oneMonth(label: '1 MONTH', approximateDays: 30),
  sixMonths(label: '6 MONTHS', approximateDays: 180),
  oneYearPlus(label: '1+ YEAR', approximateDays: 450),
  threeYearsPlus(label: '3+ YEARS', approximateDays: 1200),
  lostCount(label: "I'VE LOST COUNT", approximateDays: 1825);

  const AvoidanceDuration({
    required this.label,
    required this.approximateDays,
  });

  final String label;
  final int approximateDays;

  static AvoidanceDuration? fromName(String? name) {
    if (name == null) return null;
    for (final d in AvoidanceDuration.values) {
      if (d.name == name) return d;
    }
    return null;
  }
}

/// Act 2 — Screen 08. How long has the user been avoiding the thing?
class DurationScreen extends StatefulWidget {
  const DurationScreen({super.key});

  @override
  State<DurationScreen> createState() => _DurationScreenState();
}

class _DurationScreenState extends State<DurationScreen> {
  AvoidanceDuration? _selected;

  Future<void> _save() async {
    if (_selected == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(OnboardingPrefs.duration, _selected!.name);
    if (!mounted) return;
    context.go(ChaosRoutes.durationReflection);
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
                Text('STEP 02 / 06', style: ChaosTypography.label()),
                const SizedBox(height: ChaosSpacing.sm),
                Text('HOW LONG?', style: ChaosTypography.headline()),
                const SizedBox(height: ChaosSpacing.md),
                Text(
                  'SINCE YOU STARTED AVOIDING IT.',
                  style: ChaosTypography.data().copyWith(
                    color: ChaosColors.textMuted,
                  ),
                ),
                const SizedBox(height: ChaosSpacing.xl),
                Expanded(
                  child: ListView.separated(
                    itemCount: AvoidanceDuration.values.length,
                    separatorBuilder: (_, _) =>
                        const SizedBox(height: ChaosSpacing.sm),
                    itemBuilder: (context, i) {
                      final opt = AvoidanceDuration.values[i];
                      return OptionRow(
                        label: opt.label,
                        selected: _selected == opt,
                        onTap: () => setState(() => _selected = opt),
                      );
                    },
                  ),
                ),
                const SizedBox(height: ChaosSpacing.lg),
                StencilButton(
                  label: 'CONTINUE',
                  trailing: '▸',
                  expand: true,
                  onPressed: _selected == null ? null : _save,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
