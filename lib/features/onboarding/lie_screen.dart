import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/router.dart';
import '../../design/components/chaos_page_header.dart';
import '../../design/components/ascii_box.dart';
import '../../design/components/grid_background.dart';
import '../../design/components/option_row.dart';
import '../../design/components/stencil_button.dart';
import '../../design/tokens.dart';
import 'onboarding_prefs.dart';

const _presetLies = <String>[
  "I'LL START TOMORROW",
  "I'M NOT READY",
  'I NEED MORE TIME',
  "I'M TOO TIRED",
  "IT'S NOT THE RIGHT TIME",
  "I JUST CAN'T RIGHT NOW",
];

/// Act 2 — Screen 10. The lie they tell themselves.
/// Preset options + a "write your own" toggle that reveals a TextField.
class LieScreen extends StatefulWidget {
  const LieScreen({super.key});

  @override
  State<LieScreen> createState() => _LieScreenState();
}

class _LieScreenState extends State<LieScreen> {
  String? _selectedPreset;
  bool _customMode = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? get _effectiveLie {
    if (_customMode) {
      final t = _controller.text.trim();
      return t.isEmpty ? null : t;
    }
    return _selectedPreset;
  }

  Future<void> _save() async {
    final lie = _effectiveLie;
    if (lie == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(OnboardingPrefs.lie, lie);
    if (!mounted) return;
    context.go(ChaosRoutes.lieReflection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GridBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(ChaosSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChaosPageHeader(
                  eyebrow: 'DIAGNOSTIC',
                  title: 'WHAT DO YOU TELL YOURSELF TO DELAY IT?',
                  subtitle:
                      'Choose the excuse you use most often, or write your own.',
                  currentStep: 10,
                  totalSteps: 20,
                  onBack: () => context.go(ChaosRoutes.durationReflection),
                ),
                const SizedBox(height: ChaosSpacing.xl),
                Expanded(
                  child: ListView(
                    children: [
                      for (final l in _presetLies) ...[
                        OptionRow(
                          label: l,
                          selected: !_customMode && _selectedPreset == l,
                          onTap: () => setState(() {
                            _selectedPreset = l;
                            _customMode = false;
                          }),
                        ),
                        const SizedBox(height: ChaosSpacing.sm),
                      ],
                      OptionRow(
                        label: '─ WRITE YOUR OWN ─',
                        selected: _customMode,
                        onTap: () => setState(() {
                          _customMode = true;
                          _selectedPreset = null;
                        }),
                      ),
                      if (_customMode) ...[
                        const SizedBox(height: ChaosSpacing.md),
                        AsciiBox(
                          label: 'LIE',
                          child: TextField(
                            controller: _controller,
                            style: ChaosTypography.dataLarge(),
                            cursorColor: ChaosColors.amber,
                            cursorWidth: 2,
                            maxLines: 3,
                            textCapitalization: TextCapitalization.characters,
                            onChanged: (_) => setState(() {}),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: 'SAY IT OUT LOUD.',
                              hintStyle: ChaosTypography.dataLarge().copyWith(
                                color: ChaosColors.textMuted,
                              ),
                              contentPadding: EdgeInsets.zero,
                              isCollapsed: true,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: ChaosSpacing.lg),
                StencilButton(
                  label: 'CONTINUE',
                  trailing: '▸',
                  expand: true,
                  filled: true,
                  onPressed: _effectiveLie == null ? null : _save,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
