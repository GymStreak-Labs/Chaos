# Chaos Core Loop — Strike Pivot

_Last updated: 2026-04-29_

## Product definition

**Chaos is a live accountability strike app.**

Pick a hard thing. Start a timed strike. Get a short voice ignition. Do the work. Prove it. Keep the streak alive alone or with a squad.

Chaos is **not** an aggressive Calm and it is **not** a long-form audio library. Calm owns downshifting. Chaos owns the pre-action moment.

---

## The problem

People do not need another motivational content library. They need help crossing the gap between:

```text
I KNOW WHAT I SHOULD DO  →  I AM ACTUALLY DOING IT
```

The painful moments:

- snoozing instead of getting up
- avoiding the call, workout, outreach, study block, or hard conversation
- opening the phone to dodge the next rep
- wanting accountability but hating soft wellness language
- needing someone else in the room so they do not fold

Chaos solves **action initiation under accountability**.

---

## Calm vs Chaos usage pattern

| Calm | Chaos |
|---|---|
| end-state app | transition app |
| relax / sleep / stress relief | start / act / prove |
| passive listening can be the goal | listening is only ignition |
| long audio makes sense | long pre-action audio is suspicious |
| solo content library | solo + squad accountability |
| success = calm / asleep | success = showed up |

Calm's content is the activity. Chaos's activity is the hard thing.

---

## Primary loop

```text
DECLARE MISSION
      ↓
CHOOSE STRIKE TYPE
      ↓
SHORT AUDIO IGNITION
      ↓
TIMED ACTION WINDOW
      ↓
PROOF
      ↓
STREAK / SQUAD STATUS
      ↓
NEXT TRIGGER
```

### 1. Declare mission

The user writes one concrete thing they are about to do.

Good missions:

- `Call Dad back`
- `Send 20 sales DMs`
- `Finish the pitch deck intro`
- `Study for 20 minutes`
- `Start the workout`

Bad missions:

- `Be better`
- `Get my life together`
- `Feel motivated`

The app should push users toward verbs, timers, and proof.

---

### 2. Choose strike type

Strike types are the real product modes.

| Strike type | When used | MVP priority |
|---|---|---|
| Solo Strike | user needs immediate action | P0 |
| Squad Strike | 2–5 people start together | P1 |
| Duel | 1v1 challenge over 3/7 days | P1 |
| 5am Global Strike | shared daily ritual | P2 |
| Creator Room | hosted strikes by a coach/creator | P3 |

Old audio modes become strike presets:

- Wake Up = 2-minute ignition + get-out-of-bed proof
- Lock In = 20-minute work strike
- Workout = warm-up + first-set strike
- Reset = 5-minute recovery-to-action strike

---

### 3. Short audio ignition

Audio is a spark, not the product.

Default lengths:

- Wake Up: **60–120 sec**
- Reset: **90 sec–3 min**
- Lock In: **2–4 min**
- Workout: **2–5 min**
- Squad opener: **30–90 sec**

Audio structure:

```text
target mirror → excuse confrontation → tactical first move → countdown → strike begins
```

The audio should make the user feel seen and then immediately move them into action.

---

### 4. Timed action window

The strike window is the core unit.

MVP timers:

- 2 min — tiny action / wake-up
- 5 min — call/message/first step
- 20 min — work/study block
- 45 min — deep work / workout, later

During a strike, the app should feel like a live command room:

- target visible
- timer dominant
- squad presence visible if multiplayer
- no content browsing
- no feed
- no distractions

Optional audio during the strike should be sparse: short interventions every few minutes, not constant monologue.

---

### 5. Proof

At the end, the user submits proof.

MVP proof ladder:

1. binary honour proof: `DONE` / `FAILED`
2. optional note: `what did you ship?`
3. optional photo/screenshot proof for squads
4. peer verification later

The most important rule:

> Listening never counts as winning. Action counts.

---

### 6. Streak / squad status

After proof, the app updates identity.

Solo:

- current streak
- longest streak
- tier progress
- failed missions

Squad:

- who showed up
- who failed
- squad streak
- weak spots without harassment
- next scheduled strike

Tone:

- allowed: `You missed. Re-enlist tomorrow.`
- allowed: `3/5 showed up. Squad streak survived.`
- not allowed: pile-ons, humiliation, worthlessness language

---

### 7. Next trigger

The loop closes with a next strike invitation.

Examples:

- `0600. Wake strike starts in 5.`
- `Your squad is waiting.`
- `You said 20 DMs. Strike room open.`
- `The call is still not made.`

Retention comes from scheduled action rituals, not browsing content.

---

## MVP product promise

> **Do not fight avoidance alone. Start a strike. Prove you showed up.**

---

## MVP screen flow

### Solo first session

```text
Splash
  → what are you avoiding?
  → choose first strike preset
  → choose voice/persona
  → Today mission
  → Start Strike
  → 60–120 sec ignition
  → timed action window
  → DONE / FAILED
  → streak result
  → invite a squad / paywall
```

### Squad session

```text
Create / join squad
  → each member declares mission
  → room countdown
  → shared ignition
  → synced action timer
  → each member submits proof
  → squad result board
  → next strike scheduled
```

---

## Main app information architecture

Recommended tabs:

1. **Today** — active mission + next strike
2. **Squad** — private cell / room / invites
3. **Record** — streak, proof history, adherence
4. **Profile** — persona, tier, intensity, subscription

Avoid a content-library tab for MVP.

---

## Metrics that prove the product

P0 metrics:

- `mission_declared_rate`
- `strike_started_rate`
- `strike_completed_rate`
- `proof_submitted_rate`
- `done_rate`
- D1 / D3 / D7 return

P1 multiplayer metrics:

- `squad_created_rate`
- `invite_sent_rate`
- `invite_accepted_rate`
- `squad_strike_started_rate`
- `squad_repeat_strike_rate`
- squad D7 retention vs solo D7 retention

If audio completion is high but strike/proof is low, the app is failing.

---

## What to defer

Defer until strikes work:

- long audio library
- 70-language catalogue
- Sleep/earned-peace library
- public social feed
- open chat
- creator marketplace
- complex proof verification
- multi-speaker “excuses” episodes

---

## Product thesis

Chaos wins if the user says:

1. `This app caught me right before I folded.`
2. `The strike made me start.`
3. `My squad/streak makes it harder to disappear.`

That is the product.
