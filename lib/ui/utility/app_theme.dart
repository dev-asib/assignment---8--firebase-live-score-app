import 'package:firebase_live_score_app/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appLightThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.blackColor,
      brightness: Brightness.light,
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
    );
  }

  static ThemeData appDarkThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
    );
  }

  static TextTheme textTheme() {
    return const TextTheme(
      titleMedium: TextStyle(
        color: AppColors.whiteColor,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  static AppBarTheme appBarTheme() {
    return AppBarTheme(
      backgroundColor: AppColors.primaryAppThemeColor,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: AppColors.whiteColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        wordSpacing: 5,
        letterSpacing: 3,
      ),
    );
  }
}
