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

class PersonaScreen extends StatefulWidget {
  const PersonaScreen({super.key});

  @override
  State<PersonaScreen> createState() => _PersonaScreenState();
}

class _PersonaScreenState extends State<PersonaScreen> {
  static const _options = <_PersonaOption>[
    _PersonaOption(
      id: 'drill_sergeant',
      label: 'DRILL SERGEANT',
      description: 'No excuses. Only execution.',
      icon: Icons.military_tech_rounded,
      locked: false,
    ),
    _PersonaOption(
      id: 'cold_mentor',
      label: 'COLD MENTOR',
      description: 'Discipline over feelings.',
      icon: Icons.psychology_alt_rounded,
      locked: false,
    ),
    _PersonaOption(
      id: 'street_general',
      label: 'STREET GENERAL',
      description: 'Real talk. Results or get left.',
      icon: Icons.groups_rounded,
      locked: false,
    ),
    _PersonaOption(
      id: 'the_monk',
      label: 'THE MONK',
      description: 'Earn peace. Unlocks at Forged.',
      icon: Icons.self_improvement_rounded,
      locked: true,
    ),
  ];

  String? _selected = 'drill_sergeant';

  Future<void> _save() async {
    if (_selected == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(OnboardingPrefs.persona, _selected!);
    if (!mounted) return;
    context.go(ChaosRoutes.personaIntro);
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
                  title: 'CHOOSE YOUR VOICE',
                  subtitle:
                      "Your voice. Your standard. It's not motivation. It's enforcement.",
                  currentStep: 3,
                  totalSteps: 6,
                  onBack: () => context.go(ChaosRoutes.lieReflection),
                ),
                const SizedBox(height: ChaosSpacing.xl),
                Expanded(
                  child: ListView.separated(
                    itemCount: _options.length,
                    separatorBuilder: (_, _) =>
                        const SizedBox(height: ChaosSpacing.sm),
                    itemBuilder: (context, i) {
                      final opt = _options[i];
                      final isSelected = _selected == opt.id;
                      return _PersonaTile(
                        option: opt,
                        selected: isSelected,
                        onTap: opt.locked
                            ? null
                            : () => setState(() => _selected = opt.id),
                      );
                    },
                  ),
                ),
                const SizedBox(height: ChaosSpacing.lg),
                StencilButton(
                  label: 'CONFIRM',
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

class _PersonaOption {
  const _PersonaOption({
    required this.id,
    required this.label,
    required this.description,
    required this.icon,
    required this.locked,
  });

  final String id;
  final String label;
  final String description;
  final IconData icon;
  final bool locked;
}

class _PersonaTile extends StatelessWidget {
  const _PersonaTile({
    required this.option,
    required this.selected,
    required this.onTap,
  });

  final _PersonaOption option;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = option.locked
        ? ChaosColors.textMuted
        : selected
        ? ChaosColors.amber
        : ChaosColors.text;

    return ChaosCard(
      onTap: onTap,
      borderColor: selected ? ChaosColors.amber : ChaosColors.border,
      backgroundColor: selected
          ? ChaosColors.amber.withValues(alpha: 0.08)
          : ChaosColors.surface,
      child: Row(
        children: [
          ChaosIconTile(icon: option.icon, color: color, size: 68),
          const SizedBox(width: ChaosSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  option.label,
                  style: ChaosTypography.headline().copyWith(
                    color: color,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: ChaosSpacing.xs),
                Text(
                  option.description,
                  style: ChaosTypography.body().copyWith(
                    color: option.locked
                        ? ChaosColors.textMuted
                        : ChaosColors.text,
                  ),
                ),
                if (option.locked) ...[
                  const SizedBox(height: ChaosSpacing.xs),
                  Text(
                    'LOCKED',
                    style: ChaosTypography.body().copyWith(
                      color: ChaosColors.textMuted,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: ChaosSpacing.md),
          if (option.locked)
            const Icon(Icons.lock_outline_rounded, color: ChaosColors.textMuted)
          else
            Container(
              width: 26,
              height: 26,
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
                        size: 12,
                        color: ChaosColors.amber,
                      ),
                    )
                  : null,
            ),
        ],
      ),
    );
  }
}
