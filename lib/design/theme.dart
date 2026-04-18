import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'tokens.dart';

/// Dark-only brutalist-military ThemeData.
/// No rounding, no elevation, no ripple softness.
class ChaosTheme {
  ChaosTheme._();

  static ThemeData build() {
    const base = ColorScheme.dark(
      surface: ChaosColors.background,
      onSurface: ChaosColors.text,
      primary: ChaosColors.amber,
      onPrimary: ChaosColors.background,
      secondary: ChaosColors.amber,
      onSecondary: ChaosColors.background,
      error: ChaosColors.alert,
      onError: ChaosColors.text,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: base,
      scaffoldBackgroundColor: ChaosColors.background,
      canvasColor: ChaosColors.background,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ChaosColors.amber,
        selectionColor: Color(0x33C4A000),
        selectionHandleColor: ChaosColors.amber,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ChaosColors.background,
        foregroundColor: ChaosColors.text,
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: ChaosTypography.display(),
        headlineLarge: ChaosTypography.headline(),
        labelLarge: ChaosTypography.label(),
        bodyLarge: ChaosTypography.body(),
        bodyMedium: ChaosTypography.body(),
      ),
      dividerTheme: const DividerThemeData(
        color: ChaosColors.grid,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
