# Stage 2 — Manual Dashboard Steps

_Last updated: 2026-04-18_

Stage 1 landed the Flutter scaffold + brutalist-military design system. Stage 2
wires third-party services. Most of this is **code, already shipped**
(`lib/app/services.dart`) — the app boots even without any keys configured.

This doc lists what needs to be done *in dashboards Claude can't log into
unattended* so that every service actually activates.

All code is defensive: a missing key or missing Firebase config logs a warning
and continues. Nothing here is blocking for local development or internal
builds.

---

## 1) Firebase project (GymStreak Labs)

**Goal:** one Firebase project dedicated to Chaos.

1. In the Firebase console (signed in as a GymStreak Labs owner), create a new
   project: **`chaos-gymstreak`** (or similar).
2. Register both apps inside the project:
   - iOS — bundle id `com.gymstreak.chaos`
   - Android — package id `com.gymstreak.chaos`
3. Enable these services under the project:
   - Authentication (Email + Apple + Google to start)
   - Cloud Firestore (production mode, region `us-central` unless there's a
     reason to move it)
   - Cloud Messaging
   - Analytics
   - Crashlytics
4. Locally, from the repo root:
   ```bash
   npx -y firebase-tools login          # if not already
   flutterfire configure --project=chaos-gymstreak \
     --platforms=ios,android \
     --out=lib/firebase_options.dart
   ```
5. Commit the generated:
   - `lib/firebase_options.dart`
   - `ios/Runner/GoogleService-Info.plist`
   - `android/app/google-services.json`
6. Update `lib/main.dart` to import `firebase_options.dart` and pass it to
   `Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)`
   — this part can be a ~5-line tweak once the files exist.

**⚠️ Never share a Firebase project across apps.** Chaos gets its own.

---

## 2) RevenueCat project

**Goal:** paywall + trial + entitlement management.

1. In RevenueCat dashboard, create a new project: **Chaos**.
2. Create the iOS and Android apps inside it (same bundle / package id).
3. Collect the public SDK keys:
   - `REVENUECAT_IOS_KEY` — starts with `appl_`
   - `REVENUECAT_ANDROID_KEY` — starts with `goog_`
4. Wire the subscription products (decide weekly + annual w/ 3-day trial per
   roadmap §7.E). App Store Connect / Play Console setup follows later.
5. At build time, pass the keys via `--dart-define`:
   ```bash
   flutter run \
     --dart-define=REVENUECAT_IOS_KEY=appl_... \
     --dart-define=REVENUECAT_ANDROID_KEY=goog_...
   ```
6. Optional: store the keys in `scripts/.env.local` (gitignored) + a small
   wrapper script for `flutter run` once Stage 3 begins.

---

## 3) Gleap project

**Goal:** in-app bug reports + support threads.

1. Create a new Gleap project: **Chaos**.
2. Copy the **SDK key** (this is *not* the API token — that comes later for
   AppStore Copilot integration).
3. Pass it at build time:
   ```bash
   flutter run --dart-define=GLEAP_SDK_KEY=...
   ```
4. Optional: generate the API token (Settings → Security → API keys → Generate,
   name: "AppStore Copilot") and plug it into AppStore Copilot once that
   project exists (§5 below).

---

## 4) AppRefer

**Goal:** attribution + tracking links.

1. Create a new AppRefer app: **Chaos** (iOS + Android, bundle `com.gymstreak.chaos`).
2. Get:
   - `pk_test_...` — debug key
   - `pk_live_...` — production key
3. Pass via `--dart-define=APPREFER_KEY=pk_live_...` (debug auto-uses `pk_test`
   pattern once we plumb it — for now, pass the right key per build).
4. Note: the SDK is wired from `github.com/AppAgentic/apprefer-flutter-sdk` at
   ref `0.4.1` to stay in sync with GymStreak / GymLevels.
5. Once Firebase is wired, AppRefer's `deviceId` will be forwarded to
   RevenueCat as the `appreferId` attribute automatically (see
   `services.dart::_initAppRefer`).

---

## 5) AppStore Copilot project

**Goal:** pushing IAPs, screenshots, metadata, and Gleap ticket queries.

1. Create via admin MCP (we own GymStreak Labs — no permission dance):
   ```bash
   curl -s -X POST "https://appstorecopilot.com/api/admin-mcp" \
     -H "Authorization: Bearer <ASC_ADMIN_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{"jsonrpc":"2.0","method":"tools/call","params":{"name":"admin_create_project","arguments":{"ownerType":"personal","ownerId":"YchnOlkKSeUtLIQnEgQskzN1wEN2","name":"Chaos","storeType":"ios","appStoreAppId":"<ASC_APP_ID_ONCE_CREATED>"}},"id":1}'
   ```
2. Once the project exists and `<COPILOT_PROJECT_ID>` is known, add `.mcp.json`
   at the repo root:
   ```json
   {
     "mcpServers": {
       "appstore-ios": {
         "type": "http",
         "url": "https://appstorecopilot.com/api/mcp?projectId=<COPILOT_PROJECT_ID>",
         "headers": {
           "Authorization": "Bearer asc_15c70c241e85a0cde681be787bb6c4ff8ae7f6da66004ffbc0f17fefb75efd79"
         }
       }
     }
   }
   ```
   (GymStreak Labs user auth token — same as the other GymStreak apps.)
3. Configure Gleap API token + project id on the AppStore Copilot project so
   ticket queries work:
   ```bash
   curl -s -X POST "https://appstorecopilot.com/api/admin-mcp" \
     -H "Authorization: Bearer <ASC_ADMIN_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{"jsonrpc":"2.0","method":"tools/call","params":{"name":"admin_configure_project","arguments":{"ownerType":"personal","ownerId":"YchnOlkKSeUtLIQnEgQskzN1wEN2","projectId":"<COPILOT_PROJECT_ID>","gleapApiToken":"<JWT>","gleapProjectId":"<GLEAP_PROJECT_ID>"}},"id":2}'
   ```

---

## 6) Verification checklist

Once the above is done, run:

```bash
flutter run \
  --dart-define=APPREFER_KEY=pk_test_... \
  --dart-define=REVENUECAT_IOS_KEY=appl_... \
  --dart-define=REVENUECAT_ANDROID_KEY=goog_... \
  --dart-define=GLEAP_SDK_KEY=...
```

You should see in the console:

```
[Chaos] Firebase initialised
[Chaos] Crashlytics wired
[Chaos] AppRefer configured
[Chaos] RevenueCat configured
[Chaos] Gleap initialised
```

Any `skipped` or `failed` line = that service still needs wiring.

---

## 7) What Stage 3 looks like

Stage 3 = the Gemini TTS spike. This is where the session stub starts
generating real audio. Scope:

- Backend / Cloud Function to take (persona, avoidedThing, mode, duration) →
  script via Gemini 3.1 Pro → TTS via Gemini 3.1 Flash TTS → URL.
- Flutter client: replace session stub with a player fed by that URL.
- Audio Profile per persona so the voice stays consistent.
- Cache per user, fallback to last known good session on runtime failure.
