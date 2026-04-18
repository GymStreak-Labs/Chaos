import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/router.dart';
import '../../design/components/grid_background.dart';
import '../../design/components/stencil_button.dart';
import '../../design/tokens.dart';

const String prefsKeyMode = 'chaos.mode';

class ModeScreen extends StatefulWidget {
  const ModeScreen({super.key});

  @override
  State<ModeScreen> createState() => _ModeScreenState();
}

class _ModeScreenState extends State<ModeScreen> {
  static const _modes = <_Mode>[
    _Mode(id: 'wake_up', label: 'WAKE UP'),
    _Mode(id: 'lock_in', label: 'LOCK IN'),
    _Mode(id: 'workout', label: 'WORKOUT'),
    _Mode(id: 'reset', label: 'RESET'),
  ];

  String? _selected;

  Future<void> _save() async {
    if (_selected == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefsKeyMode, _selected!);
    if (!mounted) return;
    context.go(ChaosRoutes.home);
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
                Text('STEP 03 / 03', style: ChaosTypography.label()),
                const SizedBox(height: ChaosSpacing.sm),
                Text('PICK YOUR FRONT.',
                    style: ChaosTypography.headline()),
                const SizedBox(height: ChaosSpacing.md),
                Text(
                  'WHERE THE PRESSURE HITS HARDEST.',
                  style: ChaosTypography.data().copyWith(
                    color: ChaosColors.textMuted,
                  ),
                ),
                const SizedBox(height: ChaosSpacing.xl),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: ChaosSpacing.sm,
                    mainAxisSpacing: ChaosSpacing.sm,
                    childAspectRatio: 1.1,
                    children: [
                      for (final mode in _modes)
                        _ModeTile(
                          mode: mode,
                          selected: _selected == mode.id,
                          onTap: () {
                            HapticFeedback.selectionClick();
                            setState(() => _selected = mode.id);
                          },
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: ChaosSpacing.lg),
                StencilButton(
                  label: 'DEPLOY',
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

class _Mode {
  const _Mode({required this.id, required this.label});
  final String id;
  final String label;
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
    final color = selected ? ChaosColors.amber : ChaosColors.text;
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: const Color(0x22C4A000),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(ChaosSpacing.md),
        decoration: BoxDecoration(
          border: Border.all(color: border, width: selected ? 2 : 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selected ? '[■]' : '[□]',
              style: ChaosTypography.data().copyWith(color: color),
            ),
            Text(
              mode.label,
              style: ChaosTypography.headline().copyWith(
                color: color,
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
