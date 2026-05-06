# Chaos Roadmap — Strike Pivot

_Last updated: 2026-04-29_

## 0) Strategic pivot

The original Chaos concept was “anti-Calm”: aggressive AI audio instead of soothing meditation. That positioning is still useful for marketing, but it is not enough for the product.

The new product centre is:

> **Chaos is a live accountability strike app.**

The core loop is defined in [`docs/plans/core-loop.md`](core-loop.md):

```text
DECLARE MISSION → CHOOSE STRIKE TYPE → SHORT AUDIO IGNITION → TIMED ACTION WINDOW → PROOF → STREAK / SQUAD STATUS → NEXT TRIGGER
```

Audio is no longer the product. Audio is the ignition. The product is the strike: a timed, accountable action window that ends in proof.

The user-objection pass is captured in [`docs/plans/user-objections-product-improvements.md`](user-objections-product-improvements.md). Use it as the friction checklist before adding new surfaces.

---

## 1) Why this is stronger

### The old risk

“An aggressive Calm” forces us into a content-library problem:

- What fills 20 minutes?
- Why would users listen repeatedly?
- Does audio become procrastination?
- How do we avoid becoming novelty motivational content?

### The new wedge

The real pain is not lack of content. It is the moment before action.

Chaos owns:

- I am about to avoid something
- I need pressure now
- I need a timer
- I need proof
- I need people who will notice if I fold

That makes Chaos closer to **Focusmate + BeReal + GymStreak + anti-Calm voice**, not a meditation clone.

---

## 2) North Star

**Turn avoidance into visible action.**

A successful Chaos session is not “audio played.” A successful Chaos session is:

1. user declares a concrete mission
2. user starts a strike
3. user spends real time doing the thing
4. user submits proof
5. solo/squad record updates
6. user returns for another strike

---

## 3) Product principles

1. **Action beats content.** Listening never counts as winning.
2. **Short ignition, real work.** Default audio should be 60 seconds to 5 minutes.
3. **Proof is binary first.** `DONE` / `FAILED` before journals, notes, or mood.
4. **Multiplayer is accountability, not a feed.** Small squads beat public social.
5. **The mission must be visible.** No mission = no loop.
6. **Tone is pressure, not abuse.** Capable-of-more, never worthless.
7. **Every screen asks one thing:** what are you doing, who is with you, did you prove it?

---

## 4) MVP scope

### P0 — Solo Strike Loop

The smallest shippable product:

1. Onboarding asks: `What are you avoiding?`
2. User picks a strike preset: Wake Up / Lock In / Workout / Reset
3. User chooses a voice persona
4. Today screen shows one active mission
5. User starts a strike
6. App plays a short personalised ignition
7. Timer starts
8. User submits `DONE` or `FAILED`
9. Streak/tier updates
10. Paywall appears after proof or repeat use

P0 friction fixes:

- instant `START 5-MIN STRIKE` path for users already in avoidance
- mission templates and mission-shaping so blank input does not stall
- `SKIP TO STRIKE` after first use so audio never becomes procrastination
- recovery flow after `FAILED`: `RE-STRIKE FOR 5 MIN`
- visible intensity setting so pressure does not become contempt

### P1 — Squads

Small private groups of 2–5.

Must-have:

- create squad
- invite link
- squad room
- each member declares mission
- synced countdown/timer
- `DONE` / `FAILED` result board
- squad streak
- mission privacy levels: full mission / category only / private
- async squad windows for groups that cannot coordinate live

No open chat in MVP unless moderation is solved.

### P2 — Rituals

- 5am global strike
- 7-day duels
- scheduled squad strikes
- push notifications: `Your squad is waiting.`

---

## 5) Strike presets

| Preset | Timer | Ignition length | Job |
|---|---:|---:|---|
| Wake Up | 2 min | 60–120 sec | get out of bed / no snooze |
| Lock In | 20 min | 2–4 min | start work or study |
| Workout | 20–45 min | 2–5 min | warm up and start first set |
| Reset | 5 min | 90 sec–3 min | interrupt drift and choose next action |

Long audio is only allowed as optional in-strike ambience, not pre-action content.

---

## 6) Main app sections

Recommended app IA:

### Today

Purpose: start the next strike.

Blocks:

- active mission
- selected preset
- next scheduled squad/global strike
- primary CTA: `START STRIKE`
- current streak

### Strike

Purpose: action window.

Blocks:

- target
- timer
- optional squad presence
- sparse audio cues
- `DONE` / `FAILED`

### Squad

Purpose: multiplayer accountability.

Blocks:

- current squad
- members and current status
- next scheduled strike
- invite action
- result board

### Record

Purpose: identity proof.

Blocks:

- current streak
- longest streak
- last 30 days
- proof history
- squad streak

### Profile

Purpose: identity, persona, safety, subscription.

Blocks:

- voice persona
- tier
- intensity setting
- reminder cadence
- subscription status

---

## 7) Audio strategy

Audio stays, but shrinks.

### MVP audio types

1. **Solo ignition** — 60 sec to 5 min, personalised to mission
2. **Squad opener** — 30–90 sec, names the room and mission category
3. **Sparse in-strike cues** — short lines during the timer

### Audio template

```text
mission mirror
→ avoidance callout
→ identity reframe
→ exact first move
→ countdown
→ timer begins
```

Example:

> “Your mission is CALL DAD BACK. You are not avoiding the call. You are avoiding the discomfort before the call. Open the phone. Find the contact. At zero, you move.”

---

## 8) Monetisation

The paywall should sell accountability infrastructure, not audio volume.

Possible free tier:

- limited solo strikes/day
- one squad
- basic streak
- one voice

Paid tier:

- unlimited strikes
- multiple squads
- scheduled squad strikes
- advanced voices
- proof archive
- duels
- 5am global rituals
- deeper personalisation

Best paywall moments:

1. after first completed strike
2. when creating a squad
3. when scheduling recurring strikes
4. when joining a premium/global ritual

---

## 9) Analytics

### P0 events

- `onboarding_started`
- `mission_declared`
- `preset_selected`
- `ignition_started`
- `strike_started`
- `strike_completed`
- `proof_submitted`
- `proof_done`
- `proof_failed`
- `streak_updated`
- `paywall_viewed`
- `purchase_completed`

### P1 events

- `squad_created`
- `invite_sent`
- `invite_accepted`
- `squad_strike_scheduled`
- `squad_strike_started`
- `squad_proof_submitted`
- `squad_streak_updated`

North-star metric:

> **Completed strikes per active user per week.**

Secondary north-star:

> **Squad strikes per squad per week.**

---

## 10) Risks and guardrails

### Risk: public shame

Keep multiplayer private and bounded first. No public feed. No pile-ons.

### Risk: toxic tone

Pressure must imply belief in the user. Never worthlessness.

### Risk: fake proof

Start with honour proof. Add photo/screenshot proof and peer verification only if needed.

### Risk: social friction

Squads need low setup friction: invite link, no complex profiles, no chat required.

### Risk: App Store framing

Store positioning should be performance/accountability:

> “Timed accountability sessions to help you start hard tasks.”

Do not lead with humiliation, shame, or “negative motivation.”

---

## 11) Build order

### Stage 0 — Plan reset

- Rewrite roadmap around strikes
- Update UI architecture from audio-first to strike-first
- Define solo vs squad data model

### Stage 1 — Solo strike prototype

- Today mission card
- Start strike CTA
- ignition stub
- timer
- `DONE` / `FAILED`
- streak update
- record screen

### Stage 2 — Squad prototype

- create squad
- invite link
- squad room
- member mission cards
- synced timer mock
- result board

### Stage 3 — Personalised ignition

- Gemini script generation for short ignition
- TTS rendering
- persona consistency
- fallback ignition templates

### Stage 4 — Monetisation and retention

- RevenueCat paywall
- scheduled reminders
- duels
- 5am global strike
- analytics instrumentation

---

## 12) What we should stop doing

Stop designing around:

- long meditation-style sessions
- content categories as the main product
- huge AI audio catalogue
- passive player UX
- Calm parity

Start designing around:

- mission declaration
- strike rooms
- timers
- proof
- squads
- daily rituals

---

## 13) Short version

**Old plan:** aggressive audio app.

**New plan:** live accountability strike app.

**MVP:** declare mission → short ignition → timed strike → proof → streak.

**Multiplayer:** small squads and duels, not a feed.

**Win condition:** users complete more hard actions because Chaos makes avoidance socially and personally harder.
