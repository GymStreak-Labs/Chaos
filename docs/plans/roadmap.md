# Chaos Roadmap

_Last updated: 2026-04-28 (core loop refined)_

> Source material: #general concept thread (ts 1776291937), Gemini TTS ideation thread (ts 1776374647), naming / marketing-first pivot ("Who needs Calm when you can have Chaos"), and Calm-sized-library cost math ($3.6k raw / ~$5k all-in English vs Calm's ~$2M+). The app is the *inversion* of Calm, designed marketing-first, with brutalist-military aesthetic locked in.

---

## 0) North Star

**Chaos is the anti-Calm.** Where Calm sells peace, Chaos sells *output*. The marketing wrote itself first — every ad hook maps 1:1 to a shippable product feature. No bait-and-switch.

**Positioning line:** _Who needs Calm when you can have Chaos._

**Why now:** Gemini 3.1 Flash TTS collapses the content-library moat. A Calm-sized 2,000hr English catalogue costs ~$5k to generate (vs Calm's $2M+). All 70 languages ≈ $380k total. Catalogue depth — the incumbent moat — is effectively gone.

**Why it's a real business:**
- Goggins (12M+ followers), Jocko, Hormozi, Huberman — proven demand for confrontational self-help content. None of them own an app that delivers daily.
- Calm/Headspace skew ~70% female. Male wellness/performance is the underserved half of the market.
- Calm cannot pivot here — their brand is the moat in the *opposite* direction. Permanent white space.
- Natural cross-sell from GymStreak / GymLevels audience.
- Audio-only = commute + gym + walk. High daily session count.

---

## 1) Goal

Ship a credible **v1 of Chaos** that proves one narrow behaviour-change loop: **turn avoidance into action.**

The core loop is now defined in [`docs/plans/core-loop.md`](core-loop.md):

```text
DECLARE TARGET → CHOOSE PRESSURE → PERSONALISED AUDIO HIT → START THE STRIKE → BINARY PROOF → IDENTITY / CONSEQUENCE → RETURN TOMORROW
```

Ship the app around that loop before widening the content library. Chaos is not “lots of aggressive audio”; it is an activation ritual for the moment the user is about to avoid something.

V1 must deliver on the anti-Calm promise with a tight product loop:

1. User installs because the positioning is sharp, differentiated, and viral.
2. Onboarding identifies the user's avoided hard thing + selected voice persona.
3. App generates and delivers aggressive audio sessions that feel personal and repeatable.
4. User comes back daily to keep the streak alive.
5. Subscription unlocks the full system and premium progression.

Success for v1 is not feature breadth. It is proving that users will:
- complete onboarding,
- declare a real target,
- listen to generated audio,
- start a concrete action window,
- submit binary proof,
- return daily for the streak,
- convert on the promise of personalised pressure audio that creates action.

---

## 2) Design Language — **Brutalist Military (LOCKED)**

Every meditation app: soft gradients, rounded everything, pastel colours, nature imagery. Chaos is the opposite — raw, stripped-back, confrontational. Think *declassified briefing document meets boot camp whiteboard.* Field manual, stencil paint, chalk on slate — not Top Gun polish.

### Colour palette
- Background: matte black `#0A0A0A` (chalkboard, not screen)
- Primary text: off-white `#E8E6E1` (warm like old paper / chalk on slate)
- Accent: military amber / gold `#C4A000` (warning lights, status, stencil)
- Alert: dark military red `#8B0000` (dried blood stamp: FAILED)
- Grid/divider: dark olive `#2A2A20` (faint tactical-map lines)
- **No green.** Completion is acknowledgement, not celebration.
- **No gradients, no shadows, no blur, no pastels.** Flat, hard-edged, raw.

### Typography
- **Headlines/prompts:** stencil-influenced bold sans — Bebas Neue or Oswald. All caps, tight tracking, heavy weight. Feels stamped, not typed.
  - e.g. `MISSION BRIEF: DAY 23`, `STATUS: BEHIND SCHEDULE`
- **Data/readouts:** monospace — Share Tech Mono or Source Code Pro. Looks like a field terminal.
  - e.g. `ADHERENCE .... 78%  /  DAYS WASTED ... 11  /  GAP STATUS .... WIDENING`
- **Body:** Inter or IBM Plex Sans, small, utilitarian.

### Layout
- **Left-aligned** (centring is for wedding invitations).
- Faint olive grid in background (graph paper / tactical planning board).
- Information blocks in ASCII-bordered sections with stencil labels.
- Status markers: `[■ ACTIVE]` `[□ INCOMPLETE]` `[✗ FAILED]`.
- Massive blackspace. One prompt, one number, one truth per screen.
- No cards, no containers, no mascots, no illustrations. Text and numbers only.

### Interactions
- Only animation allowed: text reveals. No bouncing, sliding, or confetti.
- Haptics: one heavy `UIImpactFeedbackGenerator.heavy` when a hard truth lands.
- Silence > sound. No celebratory audio on completion.
- Swipe-to-dismiss (physical push-away) for key prompts — friction = engagement.

### Signature screens
- **Morning Brief** — `DAILY BRIEF — DD MMM YYYY / DAY N OF OPERATION / SITREP / TODAY'S ORDERS / ACKNOWLEDGE ▸`
- **Evening Debrief** — `AFTER ACTION REPORT / COMPLETED / EXCUSES LOGGED / STATUS`
- **Streak break** — `YOU QUIT ON YOURSELF. AGAIN.` (inverse of Duolingo's cute owl)
- **Home** — one dominant action: **LOCK IN**.

---

## 3) Marketing-First Product — Ad Angles as Forced Features

The marketing came first; the product must deliver on each angle. Each ad angle maps to a real feature. **No bait-and-switch.**

| # | Ad angle | Example hook | Forced product feature |
|---|---|---|---|
| 1 | **Anti-therapy** | "Your therapist says sit with your feelings. Chaos says weaponise them." | No mood tracker, no journaling, no "how are you feeling today?". Onboarding Q1: *"What are you avoiding?"* |
| 2 | **Masculine reclamation** | "Men aren't broken. They're bored." | Dark aesthetic, no pastels, loud onboarding, zero soft language. |
| 3 | **Results-coded** | "Calm users sleep 7.2hrs. Chaos users built 7-figure businesses." | Track *output* (workouts done, tasks crushed, cold showers) — not feelings. |
| 4 | **Cult-like belonging** | "You don't download Chaos. You enlist." | Tier system visible on profile: Recruit → Savage → Legion → Forged. Shared 5am global lock-in. Public streaks. |
| 5 | **Forbidden / edgy** | "The app Apple almost didn't approve." | Actually edgy — confrontational copy, swearing allowed in audio, brutal streak-break screens. |
| 6 | **Inversion** | "Calm puts you to sleep. Chaos wakes you up." | Mirror every Calm feature inverted — rage-up alarms vs sleep stories, intensity sessions vs meditations. *Earned peace tracks* exist but locked behind a 14-day streak. |

**Taglines to test:** _Chaos. Harness it._ / _Peace is earned._ / _Rage, weaponised._ / _Your feelings are not the point._ / _Anxiety is just untapped energy._

**Viral loop:** the daily prompt is inherently shareable. Stats like `YOU SPENT 4.2H ON YOUR PHONE YESTERDAY. YOUR GOALS GOT 0 MINUTES.` are built for screenshots → stories/Twitter → "what app is this?" → install.

---

## 4) Product Strategy — Phased

### Phase 1 — **MVP / Proof of Demand**
Build the minimum product that makes the positioning real.

Focus:
- Anti-Calm brand + brutalist-military UI
- Fast onboarding ("What are you avoiding?")
- Core daily streak loop
- 3 high-value audio formats
- Subscription paywall
- Basic analytics + crash reporting

### Phase 2 — **Retention Engine**
Turn first-session novelty into habit.

Focus:
- More session types
- Better personalisation
- Push notifications *in chosen voice* ("It's 2pm. You said you'd call him. Do it.")
- Tier progression + public tier display
- Shared 5am global lock-in (cult moment)

### Phase 3 — **Scale + Content Moat**
Make the product harder to copy and more socially sticky.

Focus:
- Multi-speaker dialogue (You vs. Your Excuses)
- Social/cult mechanics (leaderboards, tier flexing, shared rituals)
- Lifecycle messaging in persona voice
- Multi-language rollout (Portuguese, German, Japanese, Spanish — hustle-culture markets first)
- Growth loops informed by attribution + creative testing

---

## 5) Recommended MVP Scope

### Must-have user journey
1. Land in Chaos (brutalist splash — no gradient, no logo flourish)
2. Choose voice persona
3. Answer onboarding prompts
   - **Q1: What are you avoiding?** (the signature question)
   - What are you trying to become?
   - Primary use case: wake up / lock in / workout / reset
4. Generate first personalised session
5. Listen immediately
6. Start a concrete action window (`START THE STRIKE`)
7. Mark whether they did the hard thing (Yes / No)
8. See streak + locked premium value
9. Hit paywall after the first proof moment or on day two

### MVP content formats (strongest value density)
1. **Rage-up alarms** — strongest differentiation vs Calm
2. **Lock-in sessions** — strong daily repeat use (work/study focus pressure)
3. **Pre-workout hype tracks** — clear practical use case, natural GymStreak/GymLevels cross-sell

### Voice personas (onboarding picker)
- **Drill Sergeant** — boot-camp aggression
- **Cold Mentor** — Jocko-style cold precision
- **Street General** — streetwise hype
- **The Monk** — the only calm voice, **locked at tier 3** (earned peace)

### Defer from MVP
Hold until the core loop works:
- You vs. Your Excuses (multi-speaker dialogue)
- Rage meditation
- Cold shower / post-rejection / pre-meeting hit tracks
- Earned peace (calm/sleep) tracks
- Shared 5am global lock-in sync
- The Monk unlock system
- Full 70-language rollout

---

## 6) Economics — The Moat-Eraser

This section is the business case, not branding.

| | Calm (human narration) | Chaos (Gemini 3.1 Flash TTS) |
|---|---|---|
| English library (2,000 hrs) | ~$2M+ over a decade | ~$5k in a weekend |
| All 70 languages | never built (prohibitive) | ~$380k all-in |
| Celebrity narrator | hundreds of thousands per session | not needed |
| Rate | 25 audio tokens/sec · $20 per 1M tokens | — |

**Real cost isn't audio rendering — it's the LLM cost to write 10k good scripts (~$2–5k with Gemini 3.1 Pro) plus 1–2 weeks of one engineer to build the pipeline + review workflow.**

Implication: the library doesn't need to exist before launch. Generate on demand per user, cache aggressively, regenerate bad takes.

---

## 7) Execution Plan by Workstream

## A. Brand + Product Definition
- Finalise product pillars, copy system, tone guide
- Voice persona scripts (one-pager per persona: backstory, vocabulary, forbidden words, example lines)
- Screen-by-screen UX narrative
- App Store positioning draft (framed as *"motivation through honest self-reflection"* to de-risk review)

**Priority decisions:**
- Tone boundary: confrontational but not cruel. The brutally honest friend who *believes in you* but refuses to let you off the hook. **Too far** = "you're pathetic and worthless" — that's toxic and a liability. **Sweet spot** = "you know you're capable of more. Stop lying to yourself."
- Whether Chaos is framed as performance, discipline, or anti-wellness (leaning performance + discipline; anti-wellness is the ad hook, not the App Store hook)
- Which claims are product-truthful vs ad-only

## B. Onboarding
### MVP screens
1. Brutalist splash / promise
2. Choose your voice persona
3. **What are you avoiding?**
4. Choose your mode — Wake up / Lock in / Workout / Reset
5. Optional goal context
6. Generate first session (live, in front of user — demonstrate the magic)
7. Account/paywall handoff

### Data captured
`avoided_thing`, `desired_identity`, `persona`, `preferred_mode`, `notification_permission`, `paywall_trigger_state`

### Success metrics
- onboarding completion rate
- first-session play rate
- time-to-first-audio (target: <60s from first Q to audio playing)

## C. Audio Generation Pipeline
### MVP system
- Script generation via **Gemini 3.1 Pro**
- TTS rendering via **Gemini 3.1 Flash TTS** (Audio Profile per persona → voice stays constant across every session)
- Template system per mode: alarm / lock-in / workout
- Prompt variables: persona, avoided thing, target identity, energy level, duration, time of day, streak state

### Requirements
- Deterministic-enough quality (regenerate on threshold miss)
- Generation fallback if prompt fails
- Cache recent sessions per user
- Prompt-safety guardrails (see §9 Risks)
- Versioned prompt strategy (per persona × per mode) so we can A/B at the prompt layer

### Post-MVP upgrades
- Multi-speaker dialogue (You vs. Your Excuses)
- Dynamic session arcs (intro → tension → crescendo → command)
- Adaptive scripts based on streak performance ("Day 19, still here")
- Multilingual voices (70+ at launch capacity, staged rollout)

## D. Core App Experience
### MVP app sections
- Home / today's session (single CTA: **LOCK IN**)
- Session player
- Streak / progress (monospace readout, no pretty charts)
- Persona/profile (tier placeholder)
- Paywall

### Core mechanics
- Active mission: the hard thing the user is avoiding today
- Personalised pressure audio attached to that mission
- Strike window after audio: 5 / 20 minutes depending on mode
- Single daily check-in: *did you do the hard thing?* Yes / No
- Visible streak, visible tier
- Session history
- Regenerate / replay flow
- **Streak break screen: `YOU QUIT ON YOURSELF. AGAIN.`**

### UX rule
Every screen answers exactly one question:
- what should I do now?
- what should I listen to now?
- did I keep the streak alive?

## E. Monetisation
### MVP structure
- **Free:** limited generations/day, one persona, limited variety
- **Paid:** unlimited generations, all personas, longer sessions, personalisation depth, future unlocks (earned peace, advanced modes)

### Tasks
- RevenueCat integration
- Paywall design + copy in brutalist-military voice
- Entitlement gating
- Trial vs no-trial decision (bias: 3-day trial behind week/annual wall to optimise for hard conversion audience)
- Restore purchases flow

## F. Analytics / QA / Reliability
### Stack
- Firebase Analytics + Crashlytics
- Gleap
- AppRefer + Facebook SDK

### Key events
`onboarding_started`, `target_declared`, `onboarding_completed`, `persona_selected`, `first_session_generated`, `session_played`, `session_completed`, `strike_started`, `strike_completed`, `proof_submitted`, `hard_thing_yes`, `hard_thing_no`, `paywall_viewed`, `trial_started`, `purchase_completed`, `streak_broken`

### Reliability checks
- Generation failure rate
- Audio render time
- App launch stability
- Purchase funnel drop-off

## G. Launch / Growth Prep
- App Store copy + brutalist screenshots (mirror the ad aesthetic — white text on black, no gradients)
- Attribution links
- Initial Meta/TikTok creative angles mapped 1:1 to real features (see §3)
- Onboarding variants per ad angle (e.g. "anti-therapy" landing → "What are you avoiding?" first)
- 50-creator pre-launch seeding (fitness tough-love, entrepreneurship, stoic, self-improvement — NOT wellness influencers)

---

## 8) Milestones

### Milestone 0 — **Foundation**
Lock the concept before building wide.
- Product brief ✅ (CLAUDE.md)
- Roadmap ✅ (this doc)
- MVP scope frozen ✅
- Tone/copy direction agreed
- Voice persona definitions agreed
- Technical architecture outline agreed

### Milestone 1 — **Prototype the Core Loop**
Prove onboarding → generation → playback is real.
- Flutter shell + brutalist design system in place
- Onboarding flow complete (stubbed audio layer OK)
- Persona + use-case selection
- One playable personalised session generated end-to-end via Gemini TTS
- Basic analytics firing

### Milestone 2 — **MVP Beta**
Test retention and willingness to pay.
- Three core formats live (alarms / lock-in / workout)
- Streak system working
- Paywall live + RevenueCat wired
- Crashlytics + Gleap live
- Internal / beta testers can complete the full loop reliably

### Milestone 3 — **Retention Upgrade**
Improve repeat usage after first impression.
- Push notifications live, speaking in chosen persona voice
- Tier system active (Recruit → Savage → Legion → Forged)
- Better personalisation (session uses streak data, prior hard-thing outcomes)
- Content-refresh logic reduces repetition

### Milestone 4 — **Launch Readiness**
App + acquisition aligned.
- App Store assets ready
- AppRefer attribution verified end-to-end
- Each core ad angle maps to a real feature (see §3) — no bait-and-switch
- Launch build stable for paid traffic

---

## 9) Risks & Guardrails

### Mental-health liability (top risk)
Someone in a depressive episode does not need "you're wasting your life." Guardrails:
- No self-harm / worthlessness language ever
- If user consistently marks "hard thing = No" *and* session skips climb, route to a softer persona + surface a support resource
- Never use language that implies the user is broken — the frame is always: *you're capable of more, and you're lying to yourself about it.*
- Review every copy string against a "would a therapist cringe?" test

### App Store review risk
Apple may flag under "apps that encourage self-harm or negative self-image."
- Frame store listing as **"motivation through honest self-reflection"**, not "negative affirmations"
- Keep confrontational copy in-app audio (harder to screenshot) rather than in App Store metadata
- Include a visible "intensity / tone" setting so reviewer sees the product is tunable
- Have an opt-out / softer persona accessible from onboarding

### Tone calibration
- Too aggressive = toxic + retention cliff
- Too soft = another meditation app
- Canonical sweet spot: *"You know you're capable of more. Stop lying to yourself."*
- Internal tone review before any persona ships

### Cultural sensitivity
- Tough-love motivation reads very differently across cultures. For launch: English-first, then Portuguese / Spanish / German / Japanese (hustle-culture tolerance for direct speech).
- Review every localisation with a native speaker, not just MT.

### Generation quality
- Bad takes will happen. Auto-regenerate on length / silence / artefact thresholds.
- Always cache the last N good sessions per user as fallback if generation fails at runtime.

---

## 10) Suggested Build Order (practical)

Recommended sequence (both in series, not in parallel):

1. **Scaffold Flutter shell + brutalist design system** — colours, typography, ASCII-border components, grid background, heavy-haptic helper.
2. **Build onboarding flow** with *stubbed* audio (so we can pressure-test the flow before audio is wired).
3. **Wire Gemini TTS spike** — thin slice behind the stubbed audio layer. Swap in once onboarding flow is stable.
4. Define script templates for alarms / lock-in / workout.
5. Build generation service + session creation flow.
6. Build player + session state.
7. Build the strike window that turns listening into action.
8. Build streak tracking + daily check-in.
9. Add paywall + RevenueCat.
10. Add analytics / crash / feedback integrations (Firebase, Crashlytics, Gleap, AppRefer, Facebook SDK).
11. Internal dogfooding (on real alarms, real gym sessions, real lock-ins — not synthetic).
12. Beta test with ~50 seeded creators from the ad target profile.
13. Tighten launch messaging + store assets.

---

## 11) Open Questions (decisions needed early)

1. **Exact first target user?** Founders / gym-heavy men 18–30 / productivity crowd. Bias: gym-heavy men 18–30 (lowest CAC, natural GymStreak/GymLevels cross-sell).
2. **First hero use case?** Wake-up / lock-in / workout. Bias: **wake-up** — highest differentiation vs Calm, most shareable.
3. **How aggressive can the language be without hurting retention or store approval?** Need a tone panel before generation ships.
4. **Personalisation depth at launch?** Light template variables vs deep user-context generation. Bias: light variables for MVP, deep generation Phase 2.
5. **Paywall moment?** After first listen / first regenerate / day-2 value moment. Test at least two.
6. **iOS-first, Android-first, or both?** Bias: iOS-first (faster review loop + higher paying audience for performance-coded content).
7. **Do we invest in at-launch multi-language?** Bias: English-only at MVP; add PT-BR + ES + DE in Phase 2 once English retention is proven.

---

## 12) Immediate Next Actions (this week)

1. Approve this revised roadmap.
2. Freeze MVP scope to the first 3 audio formats.
3. Write the persona one-pagers (Drill Sergeant / Cold Mentor / Street General / The Monk).
4. Design onboarding + home + player + paywall in the brutalist-military system.
5. Spec script-generation templates + prompt inputs per mode.
6. Scaffold the Flutter app — design tokens, ASCII-border component, navigation, analytics stubs.
7. Build the first end-to-end audio generation prototype via Gemini 3.1 Flash TTS (persona-stable Audio Profile).
8. Draft 6 ad scripts — one per angle in §3 — ready for AdAgentic once MVP is playable.

---

## 13) Short Version

- **MVP = declare target + persona pick + 3 pressure modes + personalised audio + strike window + binary proof + streak + paywall.**
- **Design = brutalist-military, locked.**
- **Each ad angle is a forced product feature — no bait-and-switch.**
- **Build order: shell → onboarding → TTS spike → player → strike window → streak → paywall.**
- **Win by making the first personalised session create action, not just listening.**
