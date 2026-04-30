import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../design/components/chaos_card.dart';
import '../../../design/components/chaos_page_header.dart';
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
  String _modeLabel = 'WAKE UP';
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
          title: 'VOICE AND PROGRESSION',
          subtitle: 'Your current coach, tier, and locked rewards.',
        ),
        const SizedBox(height: ChaosSpacing.lg),
        ChaosCard(
          child: Row(
            children: [
              const ChaosIconTile(icon: Icons.record_voice_over_rounded),
              const SizedBox(width: ChaosSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _personaLabel,
                      style: ChaosTypography.headline().copyWith(fontSize: 30),
                    ),
                    Text(
                      'Current voice. Current standard.',
                      style: ChaosTypography.body().copyWith(
                        color: ChaosColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.md),
        ChaosCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChaosSectionLabel('Account'),
              const SizedBox(height: ChaosSpacing.md),
              _ProfileRow(label: 'ID', value: _operativeId),
              _ProfileRow(label: 'Enlisted', value: _enlistedDate()),
              _ProfileRow(label: 'Front', value: _modeLabel),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.md),
        ChaosCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChaosSectionLabel('Tier progression'),
              const SizedBox(height: ChaosSpacing.md),
              for (var i = 0; i < tiers.length; i++)
                _TierRow(
                  name: tiers[i],
                  active: i == tierIdx,
                  passed: i < tierIdx,
                ),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.md),
        ChaosCard(
          child: Row(
            children: [
              const ChaosIconTile(
                icon: Icons.lock_outline_rounded,
                color: ChaosColors.textMuted,
              ),
              const SizedBox(width: ChaosSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Earned peace',
                      style: ChaosTypography.label().copyWith(
                        color: ChaosColors.text,
                      ),
                    ),
                    const SizedBox(height: ChaosSpacing.xs),
                    Text(
                      'Locked until Legion. Peace is the prize.',
                      style: ChaosTypography.body().copyWith(
                        color: ChaosColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
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
        return 'WAKE UP';
      case 'lock_in':
        return 'LOCK IN';
      case 'workout':
        return 'WORKOUT';
      case 'reset':
        return 'RESET';
      default:
        return 'WAKE UP';
    }
  }
}

class _ProfileRow extends StatelessWidget {
  const _ProfileRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: ChaosSpacing.sm),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label.toUpperCase(),
              style: ChaosTypography.body().copyWith(
                color: ChaosColors.textMuted,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            value.toUpperCase(),
            style: ChaosTypography.body().copyWith(
              color: ChaosColors.text,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
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
    final IconData icon;
    if (active) {
      color = ChaosColors.amber;
      icon = Icons.keyboard_double_arrow_up_rounded;
    } else if (passed) {
      color = ChaosColors.text;
      icon = Icons.check_rounded;
    } else {
      color = ChaosColors.textMuted;
      icon = Icons.lock_outline_rounded;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: ChaosSpacing.sm),
      child: Row(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: ChaosSpacing.sm),
          Expanded(
            child: Text(
              name,
              style: ChaosTypography.label().copyWith(color: color),
            ),
          ),
          Text(
            active
                ? 'YOU ARE HERE'
                : passed
                ? 'CLEARED'
                : 'LOCKED',
            style: ChaosTypography.body().copyWith(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
