/// SharedPreferences keys for onboarding data.
/// Centralised so every screen reads from the same strings.
class OnboardingPrefs {
  OnboardingPrefs._();

  static const avoiding = 'chaos.onboarding.avoiding';
  static const duration = 'chaos.onboarding.duration';
  static const lie = 'chaos.onboarding.lie';
  static const persona = 'chaos.persona';
  static const mode = 'chaos.onboarding.mode';
  static const notifications = 'chaos.onboarding.notifications';
  static const strikeMinutes = 'chaos.strike.minutes';
  static const hasPlayedIgnition = 'chaos.ignition.played';
  static const intensity = 'chaos.pressure.intensity';

  /// Operative ID — generated once on first render of the profile section
  /// and reused forever. Stage 2A mock; Stage 3 will replace with a real
  /// backend-issued ID.
  static const operativeId = 'chaos.operative_id';
}
