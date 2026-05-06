# Chaos User Objections -> Product Improvements

_Last updated: 2026-05-06_

## Persona

**Name:** Marcus / Alex  
**Profile:** 24-38, ambitious but inconsistent. Works out sometimes, has career or study goals, knows what to do, often avoids the first move. Has tried productivity apps, streak apps, YouTube motivation, gym plans, calendar blocking, and maybe Focusmate.

They are not looking for therapy. They are looking for a push. But they are skeptical of anything that feels performative, fake-hard, or like another app to manage.

## Persona monologue

> "I already know what I need to do. My problem is not information. My problem is that I stall. But I also do not want an app yelling at me like a parody, making me set up some elaborate mission when I am already procrastinating. If this takes longer than opening my laptop and starting, I am gone."

> "If I can just tap DONE and lie, what is the point? If my friends can see too much, I will not invite them. If I fail and the app makes me feel like trash, I will uninstall. If it becomes a content library, I will use it to procrastinate."

## Objections and improvements

### 1. "This is just motivation content with edgy branding."

**Risk:** Chaos feels like a novelty audio app instead of a useful tool.

**Product improvement:** Make the timer and proof screen more important than the audio screen. The main product unit is the strike, not the ignition.

**Implementation implication:**
- default ignition is 30-120 seconds
- show `SKIP TO STRIKE` for returning users
- copy says "start the strike", not "listen to a session"
- analytics judge success by strike completion, not audio completion

### 2. "I do not want to spend five minutes setting up when I am already avoiding."

**Risk:** Setup becomes another procrastination surface.

**Product improvement:** Add a panic-button path: `START A 5-MIN STRIKE`.

**Implementation implication:**
- Today has one dominant instant CTA
- mission entry supports one-tap templates like `Send the message`, `Open the file`, `Start workout`, `Clean for 5`
- users can start with a rough mission and refine later
- onboarding should take under 45 seconds

### 3. "I will just lie and tap DONE."

**Risk:** Honour-system proof may feel meaningless.

**Product improvement:** Use a proof ladder, not heavy proof on day one.

**Implementation implication:**
- P0: `DONE` / `FAILED`
- P1: optional receipt: photo, screenshot, short note, completed rep count, sent-message count
- squad proof can be visible to the squad
- later: peer verification for duels or premium squads
- do not make proof so heavy that it blocks the habit

### 4. "I want accountability, but not humiliation."

**Risk:** The aggressive tone crosses into shame and churns users.

**Product improvement:** Define "pressure without contempt" as a product rule.

**Implementation implication:**
- intensity setting: `calm pressure`, `direct`, `hard`
- failure copy: "You missed. Re-enlist." not "you are weak."
- squad screens show who completed without dogpiling
- no public leaderboard for failure

### 5. "I would not invite friends if they can see embarrassing missions."

**Risk:** Multiplayer dies because the vulnerability cost is too high.

**Product improvement:** Add privacy levels for squad missions.

**Implementation implication:**
- mission visibility: `full mission`, `category only`, `private`
- examples: "Work", "Workout", "Admin", "Hard conversation"
- squad still sees strike status and proof outcome
- private squads only; no public feed in MVP

### 6. "Synchronous squad timing sounds hard to coordinate."

**Risk:** Multiplayer becomes powerful in theory but rarely used.

**Product improvement:** Support both live strikes and strike windows.

**Implementation implication:**
- live squad strike: everyone starts together
- async squad window: everyone must complete between 6-8am or by end of day
- daily result board keeps accountability without perfect scheduling
- push copy: "3/5 have already locked in."

### 7. "If I fail, I may feel worse and stop opening the app."

**Risk:** Failure turns into avoidance of the app itself.

**Product improvement:** Treat failure as a recovery loop, not a dead end.

**Implementation implication:**
- after `FAILED`, offer `RE-STRIKE FOR 5 MIN`
- preserve "showed up" separately from "completed"
- streak design can include recovery saves, not only hard breaks
- record screen should show comeback moments, not only misses

### 8. "I already use calendar, reminders, focus mode, or gym apps."

**Risk:** Chaos feels redundant.

**Product improvement:** Own the transition moment and integrate lightly with existing tools.

**Implementation implication:**
- lock screen widget / quick action: `Start Strike`
- calendar-based strike reminders later
- share sheet / Siri shortcut / Android quick tile later
- do not try to replace task managers

### 9. "The persona voice could become cringe fast."

**Risk:** Drill-sergeant novelty wears off.

**Product improvement:** Make personas functional, not theatrical.

**Implementation implication:**
- personas differ by coaching strategy: tactical, blunt, stoic, warm-direct
- allow switching persona anytime
- keep scripts specific to the mission
- earned voices are retention flavor, not core value

### 10. "I do not know what to write as my mission."

**Risk:** Blank text input stalls users.

**Product improvement:** Add mission shaping.

**Implementation implication:**
- prompt asks for verb + object + time: "What will you do in the next 20 minutes?"
- reject vague missions gently
- offer transformations: "Get my life together" -> "Clear one bill", "Open the doc", "Send one message"
- default proof suggestion attached to each mission

## Prioritised product changes

### P0 polish before deeper features

1. Add an instant `START 5-MIN STRIKE` path on Today.
2. Shorten first ignition and make `SKIP TO STRIKE` visible after first use.
3. Add mission templates and mission-shaping copy.
4. Rewrite failure state as immediate recovery: `RE-STRIKE`.
5. Add intensity setting copy to Profile, even if it is mocked initially.

### P1 multiplayer improvements

1. Mission privacy levels for squads.
2. Async squad windows alongside live squad strikes.
3. Squad result board that shows completion without humiliation.
4. Optional proof receipts for squads.

### P2 retention improvements

1. Lock screen / quick action start.
2. Scheduled strike rituals.
3. Duels with proof verification.
4. Earned persona/voice unlocks tied to completed strikes, not listening time.

## Updated product thesis

Chaos wins if it becomes the fastest way to move from avoidance to visible action.

The app should feel less like:

```text
open -> browse -> listen -> feel motivated
```

And more like:

```text
open -> declare/choose -> strike -> prove -> return
```

The test for every feature:

> Does this make the user start sooner, prove cleaner, or return tomorrow?

If not, it is probably content theatre.
