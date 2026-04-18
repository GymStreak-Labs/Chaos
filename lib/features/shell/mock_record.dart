// TODO: replace with real data layer in Stage 3 (session history in Firestore).

/// Mock adherence record used by the main shell (Stage 2A).
///
/// Every value here is fabricated so we can pressure-test the shell UI
/// without any backend. Keep the shape close to what a real session
/// history would look like: an ordered list of booleans, plus derived
/// streak / adherence counters.
class MockRecord {
  MockRecord._();

  /// True = showed up; false = missed; null = no data (pre-install).
  /// Index 0 = 30 days ago, index 29 = today.
  /// Pattern: 2 days of no-data, then 2 misses (pre-enlistment slump),
  /// then mostly showed up with a few ✗, today = showed up.
  static const List<bool?> last30 = [
    null, null, false, false, true, true, true, true, false, true,
    true, true, true, true, true, false, true, true, true, true,
    true, true, true, false, true, true, true, true, true, true,
  ];

  /// Count trailing `true` values — today's streak.
  static int get currentStreak {
    var count = 0;
    for (var i = last30.length - 1; i >= 0; i--) {
      if (last30[i] == true) {
        count++;
      } else {
        break;
      }
    }
    return count;
  }

  /// Longest run of consecutive `true` values anywhere in the window.
  static int get longestStreak {
    var longest = 0;
    var current = 0;
    for (final v in last30) {
      if (v == true) {
        current++;
        if (current > longest) longest = current;
      } else {
        current = 0;
      }
    }
    return longest;
  }

  /// Days the user showed up (true).
  static int get showedUp =>
      last30.where((v) => v == true).length;

  /// Days the user missed (false).
  static int get missed =>
      last30.where((v) => v == false).length;

  /// Total logged days (showedUp + missed), ignoring nulls.
  static int get totalLogged => showedUp + missed;

  /// Rounded adherence percentage across logged days.
  static int get adherencePct {
    if (totalLogged == 0) return 0;
    return ((showedUp / totalLogged) * 100).round();
  }

  /// Current tier name derived from [currentStreak].
  static String get tierName {
    final s = currentStreak;
    if (s < 7) return 'RECRUIT';
    if (s < 21) return 'SAVAGE';
    if (s < 60) return 'LEGION';
    return 'FORGED';
  }

  /// Current tier index (0..3).
  static int get tierIndex {
    final s = currentStreak;
    if (s < 7) return 0;
    if (s < 21) return 1;
    if (s < 60) return 2;
    return 3;
  }

  /// Yesterday = second-to-last entry (index 28).
  static bool get yesterdayWon => last30[28] == true;
}
