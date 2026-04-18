import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/router.dart';
import 'app/services.dart';
import 'design/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // All third-party services are best-effort: a missing key or missing
  // `firebase_options.dart` logs a warning but does not crash the app.
  // See `lib/app/services.dart` + `docs/ops/stage-2-manual-steps.md`.
  await bootServices();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF0A0A0A),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const ChaosApp());
}

class ChaosApp extends StatelessWidget {
  const ChaosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Chaos',
      debugShowCheckedModeBanner: false,
      theme: ChaosTheme.build(),
      darkTheme: ChaosTheme.build(),
      themeMode: ThemeMode.dark,
      routerConfig: chaosRouter,
    );
  }
}
