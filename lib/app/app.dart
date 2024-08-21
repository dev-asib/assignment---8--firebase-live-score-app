import 'package:firebase_live_score_app/ui/screens/live_score_screen.dart';
import 'package:firebase_live_score_app/ui/utility/app_theme.dart';
import 'package:flutter/material.dart';

class FirebaseLiveScoreApp extends StatelessWidget {
  const FirebaseLiveScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LiveScoreScreen(),
      theme: AppTheme.appLightThemeData(),
      darkTheme: AppTheme.appDarkThemeData(),
      themeMode: ThemeMode.system,
    );
  }
}
