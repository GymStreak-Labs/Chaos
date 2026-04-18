import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/router.dart';
import '../../design/components/ascii_box.dart';
import '../../design/components/grid_background.dart';
import '../../design/components/stencil_button.dart';
import '../../design/tokens.dart';

const String prefsKeyAvoiding = 'chaos.avoiding';

class AvoidingScreen extends StatefulWidget {
  const AvoidingScreen({super.key});

  @override
  State<AvoidingScreen> createState() => _AvoidingScreenState();
}

class _AvoidingScreenState extends State<AvoidingScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefsKeyAvoiding, text);
    if (!mounted) return;
    context.go(ChaosRoutes.onboardingMode);
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
                Text('STEP 02 / 03', style: ChaosTypography.label()),
                const SizedBox(height: ChaosSpacing.sm),
                Text('WHAT ARE YOU\nAVOIDING?',
                    style: ChaosTypography.headline()),
                const SizedBox(height: ChaosSpacing.md),
                Text(
                  'NO MOOD TRACKER. NO FEELINGS. JUST THE THING.',
                  style: ChaosTypography.data().copyWith(
                    color: ChaosColors.textMuted,
                  ),
                ),
                const SizedBox(height: ChaosSpacing.xl),
                AsciiBox(
                  label: 'TARGET',
                  child: TextField(
                    controller: _controller,
                    style: ChaosTypography.dataLarge(),
                    cursorColor: ChaosColors.amber,
                    cursorWidth: 2,
                    maxLines: 5,
                    textCapitalization: TextCapitalization.characters,
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: 'THE CALL. THE WORKOUT. THE DRAFT.',
                      hintStyle: ChaosTypography.dataLarge().copyWith(
                        color: ChaosColors.textMuted,
                      ),
                      contentPadding: EdgeInsets.zero,
                      isCollapsed: true,
                    ),
                  ),
                ),
                const Spacer(),
                StencilButton(
                  label: 'LOG IT',
                  trailing: '▸',
                  expand: true,
                  onPressed: _controller.text.trim().isEmpty ? null : _save,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
