# Chaos Roadmap

_Last updated: 2026-04-18_

## 1) Goal
Ship a credible **v1 of Chaos** that delivers on the anti-Calm promise with a tight product loop:

1. User installs because the positioning is sharp and differentiated.
2. Onboarding identifies the user's avoided hard thing + selected voice persona.
3. App generates and delivers aggressive audio sessions that feel personal and repeatable.
4. User comes back daily to keep the streak alive.
5. Subscription unlocks the full system and premium progression.

Success for v1 is not feature breadth. It is proving that users will:
- complete onboarding,
- listen to generated audio repeatedly,
- return daily for the streak,
- convert on the promise of personalised pressure audio.

---

## 2) Product Strategy

### Phase 1 — **MVP / Proof of Demand**
Build the minimum product that makes the positioning real.

Focus:
- Anti-Calm brand and UI tone
- Fast onboarding
- Core daily streak loop
- 3 high-value audio formats
- Subscription paywall
- Basic analytics + crash reporting

### Phase 2 — **Retention Engine**
Turn first-session novelty into habit.

Focus:
- More session types
- Better personalisation
- Push notifications in chosen voice
- Tier progression and unlocks
- Shared ritual moments (5am lock-in)

### Phase 3 — **Scale + Content Moat**
Make the product harder to copy and more socially sticky.

Focus:
- Deeper generation system
- Social/cult mechanics
- Better lifecycle messaging
- Multi-language rollout
- Growth loops informed by attribution + creative testing

---

## 3) Recommended MVP Scope

### Must-have user journey
1. Land in Chaos
2. Choose voice persona
3. Answer onboarding prompts
   - What are you avoiding?
   - What are you trying to become?
   - Primary use case: wake up / work / workout / bounce back
4. Generate first personalised session
5. Listen immediately
6. Mark whether they did the hard thing
7. See streak + locked premium value
8. Hit paywall before deeper usage

### MVP content formats
Prioritise only the formats with the strongest value density:

1. **Rage-up alarms**
   - personalised wake-up narration
   - strongest differentiation vs Calm
2. **Lock-in sessions**
   - work/study focus pressure audio
   - strong daily repeat use
3. **Pre-workout hype tracks**
   - clear practical use case
   - good for repeatability and shareability

### Defer from MVP
Hold these until the core loop works:
- You vs. Your Excuses multi-speaker dialogue
- Rage meditation
- Cold shower / post-rejection quick hits
- Earned peace tracks
- Shared 5am global lock-in sync
- The Monk unlock system
- Full 70-language rollout

---

## 4) Execution Plan by Workstream

## A. Brand + Product Definition
### Outcome
A sharp, consistent product identity that survives onboarding, UI, paywall, notifications, and app-store listing.

### Deliverables
- Final product pillars
- Approved copy system / tone guide
- Voice persona definitions
- Screen-by-screen UX narrative
- App Store positioning draft

### Priority decisions
- Exact tone boundary: confrontational but not cringe
- Whether Chaos is framed as performance, discipline, or anti-wellness
- Which claims are product-truthful vs ad-only hooks

---

## B. Onboarding
### Outcome
A short onboarding flow that captures enough context to generate a compelling first session.

### MVP screens
1. Brand splash / promise
2. Choose your voice persona
3. What are you avoiding?
4. Choose your mode
   - Wake up
   - Lock in
   - Workout
   - Reset
5. Optional goal context
6. Generate first session
7. Account/paywall handoff

### Data captured
- avoided thing
- desired identity/outcome
- chosen persona
- preferred content mode
- notification permission
- paywall trigger state

### Success metric
- onboarding completion rate
- first-session play rate
- time-to-first-audio

---

## C. Audio Generation Pipeline
### Outcome
Users receive personalised audio that feels intense, relevant, and non-repetitive.

### MVP system
- Script generation via Gemini 3.1 Pro
- TTS rendering via Gemini 3.1 Flash TTS
- Template system per mode:
  - alarm template
  - lock-in template
  - workout template
- Prompt variables:
  - persona
  - avoided thing
  - target identity
  - energy level
  - duration

### MVP requirements
- deterministic enough quality
- generation fallback if prompt fails
- cached recent sessions
- basic moderation / prompt safety guardrails
- reusable prompt/versioning strategy

### Post-MVP upgrades
- multi-speaker dialogue
- dynamic session arcs
- adaptive scripts based on streak performance
- multilingual voices

---

## D. Core App Experience
### Outcome
A stripped-down audio-first app with one dominant action: play the right session now.

### MVP app sections
- Home / today's session
- Session player
- Streak / progress
- Persona/profile
- Paywall / subscription

### Core mechanics
- single daily check-in: did you do the hard thing?
- visible streak
- visible tier placeholder (even if only partially active)
- session history
- regenerate / replay flow

### UX rule
Every screen should answer one question only:
- what should I do now?
- what should I listen to now?
- did I keep the streak alive?

---

## E. Monetisation
### Outcome
Subscription is part of the core product loop, not an afterthought.

### MVP monetisation design
- Free:
  - limited number of session generations / day
  - one persona
  - limited content variety
- Paid:
  - unlimited generations
  - all personas
  - longer sessions
  - workout + lock-in + alarm personalisation depth
  - future unlocks / earned peace / advanced modes

### MVP tasks
- RevenueCat integration
- paywall design and copy
- entitlement gating
- trial vs no-trial decision
- restore purchases flow

### Decision needed
Pick the launch monetisation structure:
- weekly + annual
- monthly + annual
- free trial vs immediate paid wall

---

## F. Analytics / QA / Reliability
### Outcome
We can see whether the product works and catch failures early.

### MVP stack tasks
- Firebase Analytics
- Crashlytics
- Gleap
- AppRefer + Facebook SDK wiring

### Key MVP events
- onboarding_started
- onboarding_completed
- persona_selected
- first_session_generated
- session_played
- session_completed
- hard_thing_yes
- hard_thing_no
- paywall_viewed
- trial_started / purchase_completed

### Reliability checks
- generation failure rate
- audio render time
- app launch stability
- purchase funnel drop-off

---

## G. Launch/Growth Prep
### Outcome
A launch-ready product with aligned acquisition and product truth.

### MVP growth tasks
- App Store copy + screenshots
- basic website/waitlist if needed
- attribution links
- initial Meta creative angles mapped to real features
- onboarding variants tied to ads

### Launch message
Do not market generic motivation.
Market the inversion:
- Calm puts you to sleep.
- Chaos wakes you up.

---

## 5) Milestones

## Milestone 0 — **Foundation**
**Goal:** lock the concept before building wide.

### Complete when
- product brief approved
- roadmap approved
- MVP scope frozen
- tone/copy direction agreed
- voice persona definitions agreed
- technical architecture outline agreed

## Milestone 1 — **Prototype the Core Loop**
**Goal:** prove onboarding -> generation -> playback is real.

### Complete when
- onboarding flow exists in app
- user can choose persona + use case
- app generates one playable personalised session
- player works end-to-end
- basic analytics fire correctly

## Milestone 2 — **MVP Beta**
**Goal:** test retention and willingness to pay.

### Complete when
- three core formats are live
- streak system works
- paywall is live
- RevenueCat is functioning
- crash reporting / feedback tools are live
- internal/beta testers can use full loop reliably

## Milestone 3 — **Retention Upgrade**
**Goal:** improve repeat usage after first impression.

### Complete when
- push notifications are live
- better personalisation exists
- progression/tier system appears
- content refresh logic reduces repetition

## Milestone 4 — **Launch Readiness**
**Goal:** app + acquisition are aligned.

### Complete when
- app store assets are ready
- attribution is verified
- core ad angles map to real features
- launch build is stable enough for paid traffic

---

## 6) Suggested Build Order (practical)
1. Finalise roadmap + MVP scope
2. Define onboarding questions and voice personas
3. Define script templates for the first 3 content modes
4. Build Flutter shell + navigation + dark design system
5. Build onboarding flow
6. Build generation service + session creation flow
7. Build player + session state
8. Build streak tracking
9. Add paywall + RevenueCat
10. Add analytics / crash / feedback integrations
11. Internal dogfooding
12. Beta test
13. Tighten launch messaging + store assets

---

## 7) Open Questions Blocking Execution
These should be answered early:

1. **Who is the exact first target user?**
   - founders?
   - gym-heavy men 18–30?
   - productivity/self-improvement crowd?

2. **What is the first hero use case?**
   - wake-up?
   - lock-in work?
   - workout hype?

3. **How aggressive can the language be without hurting retention/store approval?**

4. **How personalised should generation be at launch?**
   - light variables in templates
   - or deep user-context generation

5. **What is the paywall moment?**
   - after first listen?
   - after first regenerate?
   - after day 1 / day 2 value moment?

6. **Is the first release iOS-first, Android-first, or both at once?**

---

## 8) Recommended Next Actions This Week
1. Approve this roadmap
2. Freeze the MVP scope to the first 3 audio formats
3. Write onboarding questions and persona definitions
4. Design the onboarding + home + player + paywall flows
5. Spec the script generation templates and prompt inputs
6. Set up Flutter app shell + analytics + RevenueCat scaffolding
7. Build the first end-to-end audio generation prototype

---

## 9) Short Version
If we want Chaos to move fast without getting diluted:
- **MVP = onboarding + persona selection + 3 audio modes + daily streak + paywall**
- **Do not overbuild content breadth before the core loop works**
- **Win by making the first personalised session hit hard and make users come back tomorrow**
