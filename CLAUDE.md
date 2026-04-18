# Chaos

## Overview
The anti-Calm. A weaponised audio app that drags users out of bed instead of tucking them in. Where Calm/Headspace sell peace, Chaos sells **output**. Feelings are not the point — the work is the point.

**Tagline:** _Who needs Calm when you can have Chaos._

## Core Positioning
- Calm puts you to sleep. Chaos wakes you up.
- Peace is earned, not granted.
- Every feature of Calm, structurally inverted.
- Male-skewing wellness/performance app (the underserved 70% of the meditation market).
- Powered by Gemini 3.1 Flash TTS — persistent "voice in your head" Audio Profile, multi-speaker dialogue, 70 languages at launch.

## Content Library (all TTS-generated)
- **Rage-up alarms** — morning narration, personalised to the user's avoided thing
- **Pre-workout hype tracks** — 5–15 min voiced intensity, generated daily, never repeats
- **Lock-in sessions** — study/work focus pressure audio
- **You vs. Your Excuses** — multi-speaker dialogue, two voices (one is your excuses, one crushes them)
- **Rage meditation** — aggressive mantras
- **Cold shower / post-rejection fuel** — short hit audio
- **Earned peace tracks** — locked behind streaks (the only calm content, reward tier)

## Voice Personas (picked at onboarding)
- Drill Sergeant
- Cold Mentor
- Street General
- The Monk (locked — unlocks at tier 3)

## Product Principles
1. No mood tracker. No journaling. No "how are you feeling today?"
2. Onboarding Q1: "What are you avoiding?" (not how you feel)
3. Single daily metric: _Did you do the hard thing?_ Yes/No. Streak.
4. Streak break screen: "You quit on yourself. Again." (inverse of Duolingo owl cuteness)
5. Tier system: Recruit → Savage → Legion → Forged — visible on profile
6. Shared 5am global lock-in — all users listening to the same track at the same time (cult moment)
7. Voice persona speaks to the user between sessions via push notifications in their chosen voice

## Tech Stack
- **Framework**: Flutter
- **Platform**: iOS + Android
- **TTS**: Gemini 3.1 Flash TTS (70+ languages, Audio Profiles, multi-speaker)
- **Script generation**: Gemini 3.1 Pro (for story/session script writing)
- **Subscriptions**: RevenueCat
- **Analytics**: Firebase Analytics + Crashlytics
- **Error/feedback**: Gleap
- **Attribution**: AppRefer + Facebook SDK

## Project Structure
```
lib/
├── app/                  # router, env, services wiring
├── design/               # brutalist-military design system
│   ├── tokens.dart       # ChaosColors / ChaosTypography / ChaosSpacing
│   ├── theme.dart
│   └── components/       # AsciiBox, StencilButton (supports `filled:`),
│                         # StatusMarker, GridBackground, OptionRow
└── features/
    ├── onboarding/       # 20-screen enlistment flow (see below)
    │   ├── onboarding_prefs.dart          # SharedPreferences keys
    │   └── components/value_screen_scaffold.dart
    ├── shell/            # Stage 2A main app shell — 3 sections behind a
    │   │                                  # brutalist bottom tab bar,
    │   │                                  # IndexedStack preserving per-tab state.
    │   ├── main_shell.dart                # Scaffold + IndexedStack
    │   ├── bottom_tab_bar.dart            # custom 3-tab brutalist bar
    │   ├── mock_record.dart               # mock streak/adherence data
    │   └── sections/                      # today / record / profile
    ├── home/             # session + streak-break (reached from shell)
    └── paywall/
```

### Onboarding flow (20 screens, 4 acts)
Order matches roadmap tone rules — confrontational, never cruel.

1. **Splash** (`/splash`) — existing brand promise.
2. **Act 1 — Confrontation** (value screens): `intro-01` → `intro-02` → `intro-03` → `intro-04`. Three facts framing Chaos as a draft notice. Ends with amber-filled `ENLIST ▸`.
3. **Act 2 — Diagnostic** (inputs + reflections): `avoiding` → `avoiding-reflection` → `duration` → `duration-reflection` → `lie` → `lie-reflection`. Every input is echoed back at the user with a gut-punch.
4. **Act 3 — Assignment**: `persona` → `persona-intro` → `mode` → `deal` → `notifications` → `cadence`. The notifications screen stores a pref only (real permission API is Stage 3+).
5. **Act 4 — Enlistment**: `commit` → `/paywall`. Amber-filled `I AGREE ▸`. Secondary `BACK OUT` routes to `/splash`.

### Onboarding data
All keys live in `OnboardingPrefs`:
- `chaos.onboarding.avoiding` — free-text
- `chaos.onboarding.duration` — `AvoidanceDuration` enum name (`oneWeek`, `oneMonth`, `sixMonths`, `oneYearPlus`, `threeYearsPlus`, `lostCount`)
- `chaos.onboarding.lie` — preset or user-written string
- `chaos.persona` — `drill_sergeant` / `cold_mentor` / `street_general` / `the_monk` (locked)
- `chaos.onboarding.mode` — `wake_up` / `lock_in` / `workout` / `reset`
- `chaos.onboarding.notifications` — `granted` / `declined`
- `chaos.operative_id` — stable 16-char hex ID (first 8 shown on profile). Generated once by the PROFILE section on first render. Stage 2A mock.

### Main app shell (Stage 2A)
`/home` renders `MainShell` — three sections behind a brutalist bottom tab bar, `IndexedStack` preserving per-tab state:

```
[■] TODAY    [□] RECORD    [□] PROFILE
```

- `TodaySection` — today's brief, giant amber-filled `LOCK IN ▸` CTA, last-session block, ghost `REGENERATE`.
- `RecordSection` — monospace adherence readout + 30-day ✓/✗/· grid.
- `ProfileSection` — operative dossier, tier ladder (Recruit → Forged), earned-peace placeholder, and the `DEBUG · STREAK BREAK` button.

Navigation: tap a tab. No swipe, no top strip, no drawer. The bottom bar is a custom widget (`ChaosBottomTabBar`) — matte-black background, 1px olive hairline across the top, a 2px amber indicator segment animating above the active tab over 120ms linear. No icons, no badges, no ripple. Tabs trigger `HapticFeedback.selectionClick()`. All data is mock (`MockRecord`) until Stage 3 wires real session history.

### Debug shortcut
`CHAOS_INITIAL_ROUTE` (dart-define or env var, debug only) jumps to any route. Examples:
```
flutter run --dart-define=CHAOS_INITIAL_ROUTE=/onboarding/intro-04
flutter run --dart-define=CHAOS_INITIAL_ROUTE=/onboarding/duration-reflection
```

## Commands
```bash
# Development
flutter run
flutter build ios --release
flutter build appbundle --release

# Dart MCP
# Use `run_tests` (agent-optimised) instead of `flutter test`
```

## Environment Variables
_To be filled (Gemini API key, RevenueCat keys, Firebase config, etc.)_

## Design Language
- Dark-first. No pastels. No soft gradients.
- Typography: heavy, condensed, uppercase accents
- Single dominant action per screen (LOCK IN button)
- Audio-first — UI is minimal on purpose
- Confrontational copy throughout

## Ad Marketing Angles (drives product)
The marketing came first; the product must deliver on each angle:
1. **Anti-therapy** — "Your therapist says sit with your feelings. Chaos says weaponise them."
2. **Masculine reclamation** — "Men aren't broken. They're bored."
3. **Results-coded** — "Calm users sleep 7.2hrs. Chaos users built 7-figure businesses."
4. **Cult-like belonging** — "You don't download Chaos. You enlist."
5. **Forbidden** — "The app Apple almost didn't approve."
6. **Inversion** — "Calm puts you to sleep. Chaos wakes you up."

Each angle maps to a real product feature. No bait-and-switch.

## Links
- GitHub: https://github.com/GymStreak-Labs/Chaos
- Slack: #chaos
