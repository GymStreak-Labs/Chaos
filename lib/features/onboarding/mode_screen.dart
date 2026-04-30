import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/router.dart';
import '../../design/components/chaos_card.dart';
import '../../design/components/chaos_page_header.dart';
import '../../design/components/grid_background.dart';
import '../../design/components/stencil_button.dart';
import '../../design/tokens.dart';
import 'onboarding_prefs.dart';

class ModeScreen extends StatefulWidget {
  const ModeScreen({super.key});

  @override
  State<ModeScreen> createState() => _ModeScreenState();
}

class _ModeScreenState extends State<ModeScreen> {
  static const _modes = <_Mode>[
    _Mode(
      id: 'wake_up',
      label: 'WAKE UP',
      description: '2 min strike. Get upright and moving.',
      icon: Icons.wb_sunny_outlined,
    ),
    _Mode(
      id: 'lock_in',
      label: 'LOCK IN',
      description: '20 min work block. One task only.',
      icon: Icons.gps_fixed_rounded,
    ),
    _Mode(
      id: 'workout',
      label: 'WORKOUT',
      description: 'Warm up and hit the first working set.',
      icon: Icons.fitness_center_rounded,
    ),
    _Mode(
      id: 'reset',
      label: 'RESET',
      description: '5 min recovery-to-action window.',
      icon: Icons.refresh_rounded,
    ),
  ];

  String? _selected = 'wake_up';

  Future<void> _save() async {
    if (_selected == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(OnboardingPrefs.mode, _selected!);
    if (!mounted) return;
    context.go(ChaosRoutes.onboardingPersona);
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
                  eyebrow: 'STRIKE TYPE',
                  title: 'CHOOSE THE WINDOW',
                  subtitle:
                      'Pick the format that matches the action you are about to take.',
                  currentStep: 2,
                  totalSteps: 4,
                  onBack: () => context.go(ChaosRoutes.onboardingAvoiding),
                ),
                const SizedBox(height: ChaosSpacing.xl),
                Expanded(
                  child: ListView.separated(
                    itemCount: _modes.length,
                    separatorBuilder: (_, _) =>
                        const SizedBox(height: ChaosSpacing.sm),
                    itemBuilder: (context, index) {
                      final mode = _modes[index];
                      return _ModeTile(
                        mode: mode,
                        selected: _selected == mode.id,
                        onTap: () {
                          HapticFeedback.selectionClick();
                          setState(() => _selected = mode.id);
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: ChaosSpacing.lg),
                StencilButton(
                  label: 'CONTINUE',
                  trailing: '▸',
                  expand: true,
                  filled: true,
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

class _Mode {
  const _Mode({
    required this.id,
    required this.label,
    required this.description,
    required this.icon,
  });

  final String id;
  final String label;
  final String description;
  final IconData icon;
}

class _ModeTile extends StatelessWidget {
  const _ModeTile({
    required this.mode,
    required this.selected,
    required this.onTap,
  });

  final _Mode mode;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final border = selected ? ChaosColors.amber : ChaosColors.grid;
    final color = selected ? ChaosColors.amber : ChaosColors.textMuted;
    return ChaosCard(
      onTap: onTap,
      borderColor: border,
      backgroundColor: selected
          ? ChaosColors.amber.withValues(alpha: 0.08)
          : ChaosColors.surface,
      child: Row(
        children: [
          ChaosIconTile(icon: mode.icon, color: color, size: 58),
          const SizedBox(width: ChaosSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mode.label,
                  style: ChaosTypography.label().copyWith(
                    color: selected ? ChaosColors.amber : ChaosColors.text,
                  ),
                ),
                const SizedBox(height: ChaosSpacing.xs),
                Text(
                  mode.description,
                  style: ChaosTypography.body().copyWith(
                    color: ChaosColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? ChaosColors.amber : ChaosColors.textMuted,
                width: 2,
              ),
            ),
            child: selected
                ? const Center(
                    child: Icon(
                      Icons.circle,
                      color: ChaosColors.amber,
                      size: 10,
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
