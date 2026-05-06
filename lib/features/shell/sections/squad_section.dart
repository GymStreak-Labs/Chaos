import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../design/components/chaos_card.dart';
import '../../../design/components/chaos_page_header.dart';
import '../../../design/components/stencil_button.dart';
import '../../../design/tokens.dart';

/// SQUAD — private accountability, not a public feed.
///
/// Stage 2 keeps the room mocked but establishes the product surface:
/// declare together, start together, prove together.
class SquadSection extends StatelessWidget {
  const SquadSection({super.key});

  void _copyInvite(BuildContext context) {
    Clipboard.setData(
      const ClipboardData(text: 'https://chaos.app/squad/black-cell'),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: ChaosColors.surfaceRaised,
        content: Text(
          'Squad invite copied',
          style: ChaosTypography.body().copyWith(color: ChaosColors.text),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: ChaosSpacing.xxl),
      children: [
        const ChaosPageHeader(
          eyebrow: 'SQUAD',
          title: 'PRIVATE STRIKE ROOM',
          subtitle:
              'Small cells. Visible missions. Everyone starts together and proves it after.',
        ),
        const SizedBox(height: ChaosSpacing.lg),
        ChaosCard(
          borderColor: ChaosColors.amber,
          backgroundColor: ChaosColors.amber.withValues(alpha: 0.08),
          child: Row(
            children: [
              const ChaosIconTile(icon: Icons.groups_2_rounded, size: 58),
              const SizedBox(width: ChaosSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BLACK CELL',
                      style: ChaosTypography.headline().copyWith(fontSize: 32),
                    ),
                    const SizedBox(height: ChaosSpacing.xs),
                    Text(
                      '3 of 5 locked in · next strike 05:00',
                      style: ChaosTypography.body().copyWith(
                        color: ChaosColors.textMuted,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const _StatusBadge(label: 'LIVE', color: ChaosColors.amber),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.md),
        ChaosCard(
          padding: const EdgeInsets.all(ChaosSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ChaosSectionLabel('Declared missions'),
              SizedBox(height: ChaosSpacing.md),
              _MemberRow(
                name: 'JOE',
                mission: 'Send 20 sales DMs',
                visibility: 'FULL',
                status: 'READY',
                color: ChaosColors.amber,
              ),
              _MemberRow(
                name: 'ALEX',
                mission: 'WORK',
                visibility: 'CATEGORY',
                status: 'READY',
                color: ChaosColors.amber,
              ),
              _MemberRow(
                name: 'SAM',
                mission: 'PRIVATE MISSION',
                visibility: 'PRIVATE',
                status: 'WAITING',
                color: ChaosColors.textMuted,
              ),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.md),
        ChaosCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChaosSectionLabel('Room rules'),
              const SizedBox(height: ChaosSpacing.md),
              const _RoomRuleRow(
                icon: Icons.schedule_rounded,
                label: 'Strike window',
                value: '06:00-08:00 async',
              ),
              const SizedBox(height: ChaosSpacing.sm),
              const _RoomRuleRow(
                icon: Icons.visibility_off_outlined,
                label: 'Mission privacy',
                value: 'Full / category / private',
              ),
              const SizedBox(height: ChaosSpacing.sm),
              Text(
                'Live rooms still hit hardest. Async windows keep the squad useful when calendars do not line up.',
                style: ChaosTypography.body().copyWith(
                  color: ChaosColors.textMuted,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.md),
        ChaosCard(
          child: Row(
            children: [
              const ChaosIconTile(
                icon: Icons.local_fire_department_rounded,
                size: 48,
              ),
              const SizedBox(width: ChaosSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SQUAD STREAK',
                      style: ChaosTypography.label().copyWith(
                        color: ChaosColors.text,
                      ),
                    ),
                    const SizedBox(height: ChaosSpacing.xs),
                    Text(
                      '6 days clean. One miss resets the room.',
                      style: ChaosTypography.body().copyWith(
                        color: ChaosColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '6',
                style: ChaosTypography.display().copyWith(
                  color: ChaosColors.amber,
                  fontSize: 58,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.md),
        ChaosCard(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.shield_outlined,
                color: ChaosColors.textMuted,
                size: 28,
              ),
              const SizedBox(width: ChaosSpacing.md),
              Expanded(
                child: Text(
                  'No public feed. No browsing. The room exists for one reason: start together, finish honest.',
                  style: ChaosTypography.body().copyWith(
                    color: ChaosColors.textMuted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: ChaosSpacing.lg),
        StencilButton(
          label: 'START SQUAD STRIKE',
          leadingIcon: Icons.flag_outlined,
          trailing: '›',
          expand: true,
          filled: true,
          height: 58,
          onPressed: () => context.go(ChaosRoutes.strike),
        ),
        const SizedBox(height: ChaosSpacing.sm),
        StencilButton(
          label: 'COPY INVITE LINK',
          leadingIcon: Icons.link_rounded,
          expand: true,
          height: 54,
          onPressed: () => _copyInvite(context),
        ),
      ],
    );
  }
}

class _MemberRow extends StatelessWidget {
  const _MemberRow({
    required this.name,
    required this.mission,
    required this.visibility,
    required this.status,
    required this.color,
  });

  final String name;
  final String mission;
  final String visibility;
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: ChaosSpacing.sm),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ChaosColors.surfaceRaised,
              border: Border.all(color: color.withValues(alpha: 0.7)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              name.isEmpty ? '?' : name[0],
              style: ChaosTypography.label().copyWith(color: color),
            ),
          ),
          const SizedBox(width: ChaosSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: ChaosTypography.body().copyWith(
                    color: ChaosColors.text,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  mission,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: ChaosTypography.body().copyWith(
                    color: ChaosColors.textMuted,
                  ),
                ),
                Text(
                  visibility,
                  style: ChaosTypography.body().copyWith(
                    color: ChaosColors.textMuted,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: ChaosSpacing.sm),
          _StatusBadge(label: status, color: color),
        ],
      ),
    );
  }
}

class _RoomRuleRow extends StatelessWidget {
  const _RoomRuleRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: ChaosColors.amber, size: 24),
        const SizedBox(width: ChaosSpacing.md),
        Expanded(
          child: Text(
            label.toUpperCase(),
            style: ChaosTypography.body().copyWith(
              color: ChaosColors.textMuted,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Flexible(
          child: Text(
            value.toUpperCase(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: ChaosTypography.body().copyWith(
              color: ChaosColors.text,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ChaosSpacing.sm,
        vertical: ChaosSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color.withValues(alpha: 0.72)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: ChaosTypography.body().copyWith(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
