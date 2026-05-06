# Chaos

## Overview

Chaos has pivoted from “aggressive Calm” to a **live accountability strike app**.

The anti-Calm positioning still matters for marketing, but the product is no longer a long-form AI audio library. Calm owns downshifting. Chaos owns the moment before action.

**Current product definition:** _Pick a hard thing. Start a timed strike. Get a short voice ignition. Do the work. Prove it. Keep the streak alive alone or with a squad._

**Tagline direction:** _Who needs Calm when you can have Chaos._

## Core Positioning

- Calm helps users relax / sleep / downshift.
- Chaos helps users start / act / prove.
- Audio is the spark, not the product.
- The core unit is a **Strike**: a timed, accountable action window.
- Multiplayer is private accountability: squads, duels, and shared rituals — not a public feed.
- Success is not “audio played”; success is “hard thing done.”

## Core Loop

```text
DECLARE MISSION
  → CHOOSE STRIKE TYPE
  → SHORT AUDIO IGNITION
  → TIMED ACTION WINDOW
  → PROOF
  → STREAK / SQUAD STATUS
  → NEXT TRIGGER
```

See:
- `docs/plans/core-loop.md`
- `docs/plans/roadmap.md`

## Strike Types

- **Solo Strike** — immediate personal action window.
- **Squad Strike** — 2–5 people declare missions and start together.
- **Duel** — 1v1 challenge over 3/7 days.
- **5am Global Strike** — shared daily ritual / cult moment.
- **Creator Room** — future hosted strikes by coaches/creators.

Old audio modes are now strike presets:

- **Wake Up** — 2-min get-out-of-bed strike, 60–120 sec ignition.
- **Lock In** — 20-min work/study strike, 2–4 min ignition.
- **Workout** — warm-up / first-set strike, 2–5 min ignition.
- **Reset** — 5-min recovery-to-action strike, 90 sec–3 min ignition.

## Audio Strategy

Audio should be short and functional.

Default structure:

```text
mission mirror → avoidance callout → identity reframe → exact first move → countdown → strike begins
```

Long audio libraries are deferred. 20-minute audio should only exist as optional in-strike ambience / sparse cues, not pre-action content.

## Voice Personas

Personas are flavour and retention, not the whole product.

- Drill Sergeant
- Cold Mentor
- Street General
- The Monk (locked / earned peace later)

## Product Principles

1. Action beats content.
2. Listening never counts as victory.
3. No mood tracker. No journaling. No “how are you feeling today?”
4. Mission declaration must be concrete and visible.
5. Proof is binary first: `DONE` / `FAILED`.
6. Multiplayer is accountability, not social browsing.
7. Tone is pressure, not abuse: capable-of-more, never worthless.
8. Every screen should answer one question: what are you doing, who is with you, did you prove it?

## MVP Scope

### P0 — Solo Strike Loop

1. Onboarding asks: “What are you avoiding?”
2. User picks strike preset: Wake Up / Lock In / Workout / Reset.
3. User picks voice persona.
4. Today screen shows one active mission.
5. User starts a strike.
6. App plays a short personalised ignition.
7. Timer starts.
8. User submits `DONE` or `FAILED`.
9. Streak/tier updates.
10. Paywall appears after proof or repeat use.

### P1 — Squads

- create squad
- invite link
- squad room
- each member declares mission
- synced countdown/timer
- `DONE` / `FAILED` result board
- squad streak

No open public feed. No open chat in MVP unless moderation is solved.

## Tech Stack

- **Framework**: Flutter
- **Platform**: iOS + Android
- **TTS**: Gemini 3.1 Flash TTS for short ignition / persona voice
- **Script generation**: Gemini 3.1 Pro for short ignition scripts
- **Subscriptions**: RevenueCat
- **Analytics**: Firebase Analytics + Crashlytics
- **Error/feedback**: Gleap
- **Attribution**: AppRefer + Facebook SDK

## Project Structure

```text
lib/
├── app/                  # router, env, services wiring
├── design/               # Concept 02 / premium brutalist design system
│   ├── tokens.dart       # ChaosColors / ChaosTypography / ChaosSpacing
│   ├── theme.dart
│   └── components/       # ChaosCard, ChaosPageHeader, StencilButton, etc.
└── features/
    ├── onboarding/       # first-strike setup: mission, strike type, voice, ready
    ├── shell/            # main app shell: Today / Squad / Record / Profile
    ├── home/             # session, strike, streak-break screens
    └── paywall/
```

## Current Implementation Notes

- Branch `ui/clarity-pass` contains the Concept 02 redesign and the first Strike screen.
- Current app IA is strike-first:
  - Today
  - Squad
  - Record
  - Profile
- Onboarding now creates the first strike instead of running a long enlistment flow.
- P0 friction fixes are now implemented in the UI:
  - Today has an instant 5-minute strike path and quick-start mission templates.
  - Returning users can skip the ignition and go straight to the strike window.
  - Failed strikes route to a 5-minute re-strike recovery instead of shame copy.
  - Profile includes pressure/intensity calibration: Calm Pressure / Direct / Hard.
  - Squad mockup shows mission privacy levels and async strike windows.
- Current route debug shortcut:

```bash
flutter run --dart-define=CHAOS_INITIAL_ROUTE=/strike
flutter run --dart-define=CHAOS_INITIAL_ROUTE=/home
```

## Design Language

- Dark-first. No pastels. No soft gradients.
- Premium brutalist / performance aesthetic.
- Typography: heavy, condensed, uppercase accents.
- One dominant action per screen.
- Clear, conventional navigation where needed.
- Confrontational copy, but never cruel.

## Ad Marketing Angles

Marketing can still use the anti-Calm inversion, but product truth is now strike/accountability.

1. **Anti-therapy** — no mood tracker; start the thing.
2. **Masculine reclamation** — direct, performance-coded accountability.
3. **Results-coded** — track strikes completed, not feelings logged.
4. **Cult-like belonging** — squads, duels, 5am global strike.
5. **Forbidden / edgy** — pressure and proof, safely framed.
6. **Inversion** — Calm puts you down; Chaos gets you moving.

## Commands

```bash
flutter run
flutter build ios --release
flutter build appbundle --release
```

## Links

- GitHub: https://github.com/GymStreak-Labs/Chaos
- Slack: #chaos
