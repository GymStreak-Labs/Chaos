import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../design/components/grid_background.dart';
import '../../design/tokens.dart';
import 'bottom_tab_bar.dart';
import 'sections/profile_section.dart';
import 'sections/record_section.dart';
import 'sections/today_section.dart';

/// Debug-only: pick which shell section to land on at startup.
/// `CHAOS_INITIAL_SECTION=0|1|2` (today|record|profile). Ignored in release.
int _debugInitialSection() {
  if (kReleaseMode) return 0;
  const dartDefine = String.fromEnvironment('CHAOS_INITIAL_SECTION');
  if (dartDefine.isNotEmpty) {
    return int.tryParse(dartDefine)?.clamp(0, 2) ?? 0;
  }
  try {
    final env = Platform.environment['CHAOS_INITIAL_SECTION'];
    if (env != null && env.isNotEmpty) {
      return int.tryParse(env)?.clamp(0, 2) ?? 0;
    }
  } catch (_) {}
  return 0;
}

/// Main app shell — three sections behind a brutalist bottom tab bar.
///
///   [■] TODAY    [□] RECORD    [□] PROFILE
///
/// Tabs are backed by an [IndexedStack] so each section keeps its own
/// scroll + widget state across switches. No swipe, no top strip.
/// See docs/plans/roadmap.md §2 + §7.D.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late int _index = _debugInitialSection();

  void _setIndex(int i) {
    if (i == _index) return;
    HapticFeedback.selectionClick();
    setState(() => _index = i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChaosColors.background,
      body: GridBackground(
        child: SafeArea(
          bottom: false,
          child: IndexedStack(
            index: _index,
            children: const [
              _SectionPadding(child: TodaySection()),
              _SectionPadding(child: RecordSection()),
              _SectionPadding(child: ProfileSection()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ChaosBottomTabBar(
        index: _index,
        onTap: _setIndex,
      ),
    );
  }
}

/// Uniform padding applied once per section so each section doesn't
/// have to repeat its own horizontal/vertical insets.
class _SectionPadding extends StatelessWidget {
  const _SectionPadding({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        ChaosSpacing.lg,
        ChaosSpacing.md,
        ChaosSpacing.lg,
        0,
      ),
      child: child,
    );
  }
}
