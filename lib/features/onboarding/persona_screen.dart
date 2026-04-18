import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/router.dart';
import '../../design/components/chaos_page_header.dart';
import '../../design/components/grid_background.dart';
import '../../design/components/stencil_button.dart';
import '../../design/components/status_marker.dart';
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
      locked: false,
    ),
    _PersonaOption(id: 'cold_mentor', label: 'COLD MENTOR', locked: false),
    _PersonaOption(
      id: 'street_general',
      label: 'STREET GENERAL',
      locked: false,
    ),
    _PersonaOption(id: 'the_monk', label: 'THE MONK', locked: true),
  ];

  String? _selected;

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
                  title: 'CHOOSE THE VOICE YOU WANT IN YOUR HEAD.',
                  subtitle:
                      'This voice will deliver your sessions and your reminders.',
                  currentStep: 12,
                  totalSteps: 20,
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
    required this.locked,
  });

  final String id;
  final String label;
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
        : (selected ? ChaosColors.amber : ChaosColors.text);

    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: const Color(0x22C4A000),
      child: Container(
        padding: const EdgeInsets.all(ChaosSpacing.md),
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? ChaosColors.amber : ChaosColors.grid,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
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
                  if (option.locked) ...[
                    const SizedBox(height: ChaosSpacing.xs),
                    Text(
                      'LOCKED — UNLOCKS AT TIER 3',
                      style: ChaosTypography.data().copyWith(
                        color: ChaosColors.textMuted,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (option.locked)
              const StatusMarker(
                state: StatusMarkerState.failed,
                labelOverride: 'LOCKED',
              )
            else if (selected)
              const StatusMarker(state: StatusMarkerState.active)
            else
              const StatusMarker(state: StatusMarkerState.incomplete),
          ],
        ),
      ),
    );
  }
}
