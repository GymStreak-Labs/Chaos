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
_To be filled as the project develops._

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
