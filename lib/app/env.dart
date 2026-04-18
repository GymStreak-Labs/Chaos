/// Build-time environment configuration.
///
/// Values are injected via `--dart-define` at build time, e.g.:
///
/// ```bash
/// flutter run \
///   --dart-define=APPREFER_KEY=pk_test_xxx \
///   --dart-define=REVENUECAT_IOS_KEY=appl_xxx \
///   --dart-define=REVENUECAT_ANDROID_KEY=goog_xxx \
///   --dart-define=GLEAP_SDK_KEY=xxx
/// ```
///
/// Missing keys disable the corresponding service — the app still boots.
class Env {
  const Env._();

  // Firebase is wired via `flutterfire configure` (firebase_options.dart).
  // No Env entry needed for it.

  static const String appReferKey = String.fromEnvironment('APPREFER_KEY');
  static const String revenueCatIosKey =
      String.fromEnvironment('REVENUECAT_IOS_KEY');
  static const String revenueCatAndroidKey =
      String.fromEnvironment('REVENUECAT_ANDROID_KEY');
  static const String gleapSdkKey = String.fromEnvironment('GLEAP_SDK_KEY');

  static bool get hasAppRefer => appReferKey.isNotEmpty;
  static bool get hasRevenueCat =>
      revenueCatIosKey.isNotEmpty || revenueCatAndroidKey.isNotEmpty;
  static bool get hasGleap => gleapSdkKey.isNotEmpty;
}
