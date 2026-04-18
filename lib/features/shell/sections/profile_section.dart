import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/router.dart';
import '../../../design/components/chaos_page_header.dart';
import '../../../design/components/ascii_box.dart';
import '../../../design/components/stencil_button.dart';
import '../../../design/tokens.dart';
import '../../onboarding/onboarding_prefs.dart';
import '../mock_record.dart';

/// PROFILE — operative dossier + tier ladder + earned-peace placeholder.
///
/// All mock for Stage 2A. Persona pulled from onboarding prefs; ID
/// generated once and cached in prefs.
class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  String _personaLabel = 'UNASSIGNED';
  String _modeLabel = 'RAGE-UP';
  String _operativeId = '--------';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();

    var id = prefs.getString(OnboardingPrefs.operativeId);
    if (id == null || id.length < 8) {
      id = _generateId();
      await prefs.setString(OnboardingPrefs.operativeId, id);
    }

    final personaKey = prefs.getString(OnboardingPrefs.persona);
    final modeKey = prefs.getString(OnboardingPrefs.mode);

    if (!mounted) return;
    setState(() {
      _operativeId = id!.substring(0, 8).toUpperCase();
      _personaLabel = _personaName(personaKey);
      _modeLabel = _modeName(modeKey);
    });
  }

  String _generateId() {
    final rng = Random.secure();
    const chars = '0123456789abcdef';
    return List.generate(16, (_) => chars[rng.nextInt(chars.length)]).join();
  }

  @override
  Widget build(BuildContext context) {
    final tierIdx = MockRecord.tierIndex;
    final tiers = const ['RECRUIT', 'SAVAGE', 'LEGION', 'FORGED'];

    return ListView(
      padding: const EdgeInsets.only(bottom: ChaosSpacing.xxl),
      children: [
        const ChaosPageHeader(
          eyebrow: 'PROFILE',
          title: 'YOUR VOICE AND PROGRESSION',
          subtitle:
              'This tab shows the voice you chose, your current tier, and what you unlock by staying consistent.',
        ),
        const SizedBox(height: ChaosSpacing.lg),
        Text(_personaLabel, style: ChaosTypography.headline()),
        const SizedBox(height: ChaosSpacing.lg),
        AsciiBox(
          label: 'ACCOUNT',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_pad('ID', _operativeId), style: ChaosTypography.data()),
              Text(
                _pad('ENLISTED', _enlistedDate()),
                style: ChaosTypography.data(),
              ),
              Text(_pad('VOICE', _personaLabel), style: ChaosTypography.data()),
              Text(_pad('FRONT', _modeLabel), style: ChaosTypography.data()),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.xl),
        Text('PROGRESSION', style: ChaosTypography.label()),
        const SizedBox(height: ChaosSpacing.sm),
        for (var i = 0; i < tiers.length; i++) ...[
          _TierRow(name: tiers[i], active: i == tierIdx, passed: i < tierIdx),
          if (i < tiers.length - 1) const SizedBox(height: ChaosSpacing.xs),
        ],
        const SizedBox(height: ChaosSpacing.xl),
        AsciiBox(
          label: 'EARNED PEACE',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LOCKED — UNLOCKS AT TIER 3 (LEGION).',
                style: ChaosTypography.data(),
              ),
              const SizedBox(height: ChaosSpacing.xs),
              Text(
                'YOU WILL EARN IT. NOT RECEIVE IT.',
                style: ChaosTypography.data().copyWith(
                  color: ChaosColors.textMuted,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.xl),
        StencilButton(
          label: 'DEBUG · STREAK BREAK',
          expand: true,
          onPressed: () => context.go(ChaosRoutes.streakBreak),
        ),
      ],
    );
  }

  String _pad(String key, String value) {
    const totalWidth = 28;
    final filler = (totalWidth - key.length - value.length).clamp(3, 99);
    return '$key ${'.' * filler} $value';
  }

  String _enlistedDate() {
    // Mock: 12 days ago from today.
    final d = DateTime.now().subtract(const Duration(days: 12));
    const months = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC',
    ];
    final dd = d.day.toString().padLeft(2, '0');
    return '$dd ${months[d.month - 1]} ${d.year}';
  }

  String _personaName(String? key) {
    switch (key) {
      case 'drill_sergeant':
        return 'DRILL SERGEANT';
      case 'cold_mentor':
        return 'COLD MENTOR';
      case 'street_general':
        return 'STREET GENERAL';
      case 'the_monk':
        return 'THE MONK';
      default:
        return 'UNASSIGNED';
    }
  }

  String _modeName(String? key) {
    switch (key) {
      case 'wake_up':
        return 'RAGE-UP';
      case 'lock_in':
        return 'LOCK-IN';
      case 'workout':
        return 'PRE-WORKOUT';
      case 'reset':
        return 'RESET';
      default:
        return 'RAGE-UP';
    }
  }
}

class _TierRow extends StatelessWidget {
  const _TierRow({
    required this.name,
    required this.active,
    required this.passed,
  });

  final String name;
  final bool active;
  final bool passed;

  @override
  Widget build(BuildContext context) {
    final Color color;
    final String marker;
    if (active) {
      color = ChaosColors.amber;
      marker = '[■ ACTIVE]';
    } else if (passed) {
      color = ChaosColors.text;
      marker = '[■ CLEARED]';
    } else {
      color = ChaosColors.textMuted;
      marker = '[□ LOCKED]';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: ChaosSpacing.xs),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: ChaosTypography.headline().copyWith(
                color: color,
                fontSize: 24,
              ),
            ),
          ),
          Text(marker, style: ChaosTypography.data().copyWith(color: color)),
        ],
      ),
    );
  }
}
