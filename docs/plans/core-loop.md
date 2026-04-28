# Chaos Core Loop

_Last updated: 2026-04-28_

## One-line product definition

**Chaos turns avoidance into a daily action ritual.**

It is not a meditation library. It is not an aggressive podcast app. It is a state-change tool for the moment when a user knows the right thing to do and is about to avoid it.

---

## The problem

People do not usually need more advice. They need help crossing the gap between **knowing** and **starting**.

Chaos exists for these moments:

- snoozing instead of getting up
- avoiding the call, email, workout, study block, sales outreach, or hard conversation
- opening a phone to escape the thing they already know matters
- wanting accountability without soft wellness language

The app solves **action initiation** for users who dislike gentle self-help.

---

## The core promise

> Open Chaos when you are about to avoid something. Chaos names the target, kills the excuse, pushes you into a short action window, and makes you prove whether you showed up.

If the product does not create action within the first session, it failed.

---

## Primary loop

```text
DECLARE TARGET
      ↓
CHOOSE PRESSURE
      ↓
PERSONALISED AUDIO HIT
      ↓
START THE STRIKE
      ↓
BINARY PROOF
      ↓
IDENTITY / CONSEQUENCE
      ↓
RETURN TOMORROW
```

### 1. Declare target

The user states the hard thing in plain language.

Examples:

- `Call Dad back`
- `Finish the pitch deck`
- `Go to the gym`
- `Send the invoice`
- `Study for 20 minutes`

This is not journaling. It is target acquisition.

**UX requirement:** The Today screen must always show one active mission. No mission = no loop.

---

### 2. Choose pressure

Modes are entry points into the same loop, not separate product worlds.

| Mode | User intent | Session job |
|---|---|---|
| Wake Up | I am trying to get out of bed | break inertia immediately |
| Lock In | I need to work/study | remove distraction and start focus |
| Workout | I need to train | raise intensity and begin the set/session |
| Reset | I am spiralling/drifting | cut noise and re-enter action |

**UX requirement:** Mode choice should stay understandable and conventional: label, icon, description, selected state.

---

### 3. Personalised audio hit

Audio is the state-change mechanic.

MVP length target:

- **3–5 min** for Wake Up / Reset
- **5–8 min** for Lock In / Workout

The audio must reference:

- target
- persona
- mode
- prior outcome/streak
- immediate command

Bad audio: generic hype.

Good audio: `You said you were going to call Dad back. You have delayed it for a year. We are not negotiating with discomfort today. When this ends, you make the call.`

**UX requirement:** Player should feel like a mission instrument, not a content browsing screen.

---

### 4. Start the strike

The most important refinement: listening is not the finish line.

After audio, the user must be launched into a concrete action window.

MVP strike options:

- `START 5-MIN STRIKE` for calls / messages / small starts
- `START 20-MIN STRIKE` for work/study
- `START WORKOUT` for training
- `I DID IT ALREADY` escape hatch for real-world completion

**Why this matters:** Without a strike window, the app becomes entertainment. With a strike window, it becomes behaviour change.

---

### 5. Binary proof

After the strike window, Chaos asks one question:

> **Did you do the hard thing?**

Allowed answers:

- `YES`
- `NO`

No mood tracker. No journal. No essay.

**UX requirement:** The app must never let the user feel that listening alone counts as victory. Victory is action.

---

### 6. Identity / consequence

The check-in updates the user identity system.

If `YES`:

- streak continues
- tier progress advances
- Today result becomes `SHOWED UP`
- future audio can reference the win

If `NO`:

- streak breaks or mission is marked failed
- user sees the red failure state
- app offers `RE-ENLIST`
- future audio references the miss without worthlessness language

Tone rule:

- Allowed: `You missed. Start again.`
- Allowed: `Accountability is the standard.`
- Not allowed: `You are worthless.`

---

### 7. Return tomorrow

The loop closes with a next trigger.

Retention is not “come browse more audio.” Retention is:

> `Tomorrow at the moment you usually fold, Chaos shows up.`

Push notification examples:

- `0600. No snooze. Get up.`
- `You said 20 minutes. Start now.`
- `The call is still not made.`
- `Your streak survives today or it does not.`

---

## MVP screen flow

### First session

```text
Splash
  → Value screens
  → Declare avoided thing
  → Pick voice
  → Pick mode
  → Permission / cadence
  → Today mission
  → Audio hit
  → Strike window
  → Yes/No proof
  → Streak / paywall
```

### Daily repeat session

```text
Push / app open
  → Today mission
  → Start session
  → Audio hit
  → Strike window
  → Yes/No proof
  → Record updated
```

---

## What the main app should become

### Today

Purpose: start the loop.

Required blocks:

1. `TODAY'S MISSION` — the target
2. `PRESSURE MODE` — Wake Up / Lock In / Workout / Reset
3. `START SESSION` — one dominant CTA
4. `STRIKE STATUS` — not started / in progress / awaiting proof / complete
5. current streak summary

### Session player

Purpose: state-change.

Required blocks:

1. persona
2. mission target
3. progress ring / waveform
4. controls
5. next action: `START THE STRIKE`

### Strike

Purpose: bridge audio into real action.

Required blocks:

1. timer
2. target
3. `I DID IT` / `I FAILED` / `ADD 5 MIN`
4. clear exit back to proof

### Record

Purpose: identity reinforcement.

Required blocks:

1. current streak
2. longest streak
3. adherence
4. last 30 days
5. tier progression

### Profile

Purpose: progression and persona.

Required blocks:

1. current voice
2. tier
3. unlocks
4. reminder cadence
5. tone/intensity setting later for safety/App Store review

---

## Metrics that prove the loop

The app is working if these move:

1. `target_declared_rate` — users who create a real mission
2. `first_audio_started_rate`
3. `first_audio_completed_rate`
4. `strike_started_rate` — the most important new metric
5. `proof_submitted_rate`
6. `hard_thing_yes_rate`
7. D1 / D3 / D7 return
8. streak survival rate
9. paywall conversion after first proof or day two

If `audio_completed_rate` is high but `strike_started_rate` is low, Chaos is becoming content, not action. Fix the loop.

---

## Monetisation fit

Paywall should appear after the product has proven the loop once.

Best MVP moments to test:

1. after first `YES` proof — “keep this system alive”
2. day two before regeneration — “today's pressure is ready”
3. after user tries to change persona or regenerate

Avoid paywalling before the first action proof unless acquisition economics demand it.

---

## What not to build yet

Do not widen before this loop works.

Defer:

- large audio library browsing
- social leaderboards
- multi-speaker excuses dialogue
- 70-language rollout
- advanced earned-peace content
- complex analytics dashboards
- too many modes

A narrow habit beats a broad content app.

---

## Product thesis

Chaos wins if users feel:

1. `This app sees the thing I am avoiding.`
2. `The audio made me move.`
3. `I want to keep proving I am the kind of person who shows up.`

That is the loop.
