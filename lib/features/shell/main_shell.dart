import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../design/components/grid_background.dart';
import '../../design/tokens.dart';
import 'sections/profile_section.dart';
import 'sections/record_section.dart';
import 'sections/today_section.dart';
import 'top_nav_label.dart';

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

/// Main app shell — three swipeable sections with a minimal top nav.
///
/// [ TODAY ]   RECORD   PROFILE
///
/// Swipe left/right or tap a label to navigate. No bottom nav, no
/// hamburger, no drawer. See docs/plans/roadmap.md §2 + §7.D.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late final int _initialIndex = _debugInitialSection();
  late final PageController _controller =
      PageController(initialPage: _initialIndex);
  late int _index = _initialIndex;

  static const _labels = <String>['TODAY', 'RECORD', 'PROFILE'];
  static const _transitionDuration = Duration(milliseconds: 150);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _jumpTo(int i) {
    if (i == _index) return;
    _controller.animateToPage(
      i,
      duration: _transitionDuration,
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  ChaosSpacing.lg,
                  ChaosSpacing.md,
                  ChaosSpacing.lg,
                  ChaosSpacing.md,
                ),
                child: Row(
                  children: [
                    for (var i = 0; i < _labels.length; i++) ...[
                      TopNavLabel(
                        label: _labels[i],
                        active: _index == i,
                        onTap: () => _jumpTo(i),
                      ),
                      if (i < _labels.length - 1)
                        const SizedBox(width: ChaosSpacing.md),
                    ],
                  ],
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: ChaosColors.grid,
              ),
              Expanded(
                child: PageView(
                  controller: _controller,
                  physics: const PageScrollPhysics(),
                  onPageChanged: (i) => setState(() => _index = i),
                  children: const [
                    _SectionPadding(child: TodaySection()),
                    _SectionPadding(child: RecordSection()),
                    _SectionPadding(child: ProfileSection()),
                  ],
                ),
              ),
            ],
          ),
        ),
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
