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
    await prefs.setString(OnboardingPrefs.avoiding, text);
    if (!mounted) return;
    context.go(ChaosRoutes.avoidingReflection);
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
                  title: 'WHAT ARE YOU AVOIDING?',
                  subtitle:
                      'Type the one thing you keep putting off. This answer shapes your first session.',
                  currentStep: 2,
                  totalSteps: 6,
                  onBack: () => context.go(ChaosRoutes.intro04),
                ),
                const SizedBox(height: ChaosSpacing.xl),
                ChaosCard(
                  borderColor: ChaosColors.border,
                  backgroundColor: ChaosColors.surface,
                  child: TextField(
                    controller: _controller,
                    style: ChaosTypography.body().copyWith(
                      fontSize: 17,
                      height: 1.45,
                      color: ChaosColors.text,
                    ),
                    cursorColor: ChaosColors.amber,
                    cursorWidth: 2,
                    minLines: 7,
                    maxLines: 7,
                    textCapitalization: TextCapitalization.sentences,
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: 'Type your answer here...',
                      hintStyle: ChaosTypography.body().copyWith(
                        color: ChaosColors.textMuted,
                        fontSize: 17,
                      ),
                      contentPadding: EdgeInsets.zero,
                      isCollapsed: true,
                    ),
                  ),
                ),
                const SizedBox(height: ChaosSpacing.md),
                const ChaosCard(
                  backgroundColor: ChaosColors.surfaceRaised,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChaosIconTile(
                        icon: Icons.error_outline_rounded,
                        size: 42,
                      ),
                      SizedBox(width: ChaosSpacing.md),
                      Expanded(
                        child: Text(
                          'Examples: the work you keep delaying, the call you avoid, the habit you keep justifying.',
                          style: TextStyle(
                            color: ChaosColors.textMuted,
                            height: 1.35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                StencilButton(
                  label: 'CONTINUE',
                  trailing: '▸',
                  expand: true,
                  filled: true,
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
