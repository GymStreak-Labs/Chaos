import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Brutalist-military design tokens for Chaos.
/// Locked per roadmap §2. No gradients, no shadows, no pastels.
class ChaosColors {
  ChaosColors._();

  /// Matte black — chalkboard, not screen.
  static const Color background = Color(0xFF0A0A0A);

  /// Warm off-white — old paper / chalk on slate.
  static const Color text = Color(0xFFE8E6E1);

  /// Muted variant for secondary copy.
  static const Color textMuted = Color(0xFF8A8680);

  /// Military amber — warnings, stencil labels, primary accent.
  static const Color amber = Color(0xFFC4A000);

  /// Dark military red — FAILED stamps, breach states.
  static const Color alert = Color(0xFF8B0000);

  /// Faint olive — grid lines / tactical map.
  static const Color grid = Color(0xFF2A2A20);
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
        letterSpacing: 4,
        fontWeight: FontWeight.w700,
        color: ChaosColors.text,
      );

  /// Section headline. E.g. "MISSION BRIEF".
  static TextStyle headline() => GoogleFonts.oswald(
        fontSize: 36,
        height: 1.05,
        letterSpacing: 2,
        fontWeight: FontWeight.w700,
        color: ChaosColors.text,
      );

  /// Stencil label. E.g. "DAY 23 OF OPERATION".
  static TextStyle label() => GoogleFonts.oswald(
        fontSize: 16,
        height: 1.2,
        letterSpacing: 2,
        fontWeight: FontWeight.w600,
        color: ChaosColors.amber,
      );

  /// Monospace data readout. E.g. "ADHERENCE .... 78%".
  static TextStyle data() => GoogleFonts.shareTechMono(
        fontSize: 14,
        height: 1.4,
        letterSpacing: 1,
        color: ChaosColors.text,
      );

  /// Monospace input / body-mono.
  static TextStyle dataLarge() => GoogleFonts.shareTechMono(
        fontSize: 18,
        height: 1.4,
        letterSpacing: 1,
        color: ChaosColors.text,
      );

  /// Utilitarian body copy.
  static TextStyle body() => GoogleFonts.inter(
        fontSize: 14,
        height: 1.4,
        color: ChaosColors.text,
      );

  /// Button text — stencil, uppercase, amber.
  static TextStyle button() => GoogleFonts.oswald(
        fontSize: 18,
        height: 1.0,
        letterSpacing: 3,
        fontWeight: FontWeight.w700,
        color: ChaosColors.amber,
      );
}
