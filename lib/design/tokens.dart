import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Premium performance design tokens for Chaos.
/// Dark, direct, and physical without making the app hard to read.
class ChaosColors {
  ChaosColors._();

  /// Off-black app background.
  static const Color background = Color(0xFF090909);

  /// Graphite card surface.
  static const Color surface = Color(0xFF121212);

  /// Raised surface used for nested controls.
  static const Color surfaceRaised = Color(0xFF1A1A1A);

  /// Hairline borders on dark surfaces.
  static const Color border = Color(0xFF343434);

  /// Warm off-white — old paper / chalk on slate.
  static const Color text = Color(0xFFF1F0EC);

  /// Muted variant for secondary copy.
  static const Color textMuted = Color(0xFF9A9690);

  /// Performance amber — primary action and active state.
  static const Color amber = Color(0xFFE59B16);

  /// Dark military red — FAILED stamps, breach states.
  static const Color alert = Color(0xFFE04A3A);

  /// Positive accountability state.
  static const Color success = Color(0xFF8CC152);

  /// Faint grid lines / tactical texture.
  static const Color grid = Color(0xFF181814);
}

class ChaosSpacing {
  ChaosSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;
}

/// Typography tokens.
/// - Headers: Oswald (stencil-adjacent, widely available). Bebas Neue is a valid alt.
/// - Data: Share Tech Mono (field terminal).
/// - Body: Inter.
class ChaosTypography {
  ChaosTypography._();

  /// Massive stencil headline. E.g. "CHAOS", "LOCK IN".
  static TextStyle display() => GoogleFonts.oswald(
    fontSize: 96,
    height: 1.0,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
    color: ChaosColors.text,
  );

  /// Section headline. E.g. "MISSION BRIEF".
  static TextStyle headline() => GoogleFonts.oswald(
    fontSize: 36,
    height: 1.05,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
    color: ChaosColors.text,
  );

  /// Stencil label. E.g. "DAY 23 OF OPERATION".
  static TextStyle label() => GoogleFonts.oswald(
    fontSize: 16,
    height: 1.2,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
    color: ChaosColors.amber,
  );

  /// Monospace data readout. E.g. "ADHERENCE .... 78%".
  static TextStyle data() => GoogleFonts.shareTechMono(
    fontSize: 14,
    height: 1.4,
    letterSpacing: 0,
    color: ChaosColors.text,
  );

  /// Monospace input / body-mono.
  static TextStyle dataLarge() => GoogleFonts.shareTechMono(
    fontSize: 18,
    height: 1.4,
    letterSpacing: 0,
    color: ChaosColors.text,
  );

  /// Utilitarian body copy.
  static TextStyle body() =>
      GoogleFonts.inter(fontSize: 14, height: 1.4, color: ChaosColors.text);

  /// Button text — stencil, uppercase, amber.
  static TextStyle button() => GoogleFonts.oswald(
    fontSize: 18,
    height: 1.0,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
    color: ChaosColors.amber,
  );
}
