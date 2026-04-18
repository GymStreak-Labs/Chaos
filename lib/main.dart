import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/router.dart';
import 'design/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Firebase.initializeApp() once google-services files are wired (Stage 2).
  // TODO: Purchases.configure() for RevenueCat once keys are wired (Stage 3).
  // TODO: Gleap.initialize() once Gleap API key is wired (Stage 4).
  // TODO: apprefer integration — package not yet confirmed on pub.dev.

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
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
