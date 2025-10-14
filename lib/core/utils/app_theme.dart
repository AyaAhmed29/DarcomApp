import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.orange75,
      selectedItemColor: AppColors.gray900,
      unselectedItemColor: AppColors.gray600,
      showUnselectedLabels: true,
    ),
    primaryColor: AppColors.orange500,
    scaffoldBackgroundColor: AppColors.orange75,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.orange75,
      foregroundColor: AppColors.gray600,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.gray900,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.gray900, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.gray700, fontSize: 14),
      bodySmall: TextStyle(color: AppColors.gray600, fontSize: 12),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.orange500,
      onPrimary: AppColors.white,
      secondary: AppColors.orange300,
      onSecondary: AppColors.gray900,
      error: Colors.red,
      onError: Colors.white,
      surface: AppColors.orange100,
      onSurface: AppColors.gray800,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.orange500,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.orange100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: AppColors.gray500),
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.orange700,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.gray900,
      selectedItemColor: AppColors.orange300,
      unselectedItemColor: AppColors.gray200,
      showUnselectedLabels: true,
    ),
    scaffoldBackgroundColor: AppColors.orange1000,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.gray900,
      foregroundColor: AppColors.gray200,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.gray200, fontSize: 14),
      bodySmall: TextStyle(color: AppColors.gray400, fontSize: 12),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.orange700,
      onPrimary: Colors.white,
      secondary: AppColors.orange400,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      surface: AppColors.gray800,
      onSurface: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.orange400,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.gray800,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: AppColors.gray400),
    ),
  );
}
