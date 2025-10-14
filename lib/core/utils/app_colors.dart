import 'package:flutter/material.dart';

abstract class AppColors {
  // Lavender Palette
  static const Color lavender50 = Color(0xFFFAF9FD);
  static const Color lavender100 = Color(0xFFF1EDFA);
  static const Color lavender200 = Color(0xFFE6E6FA); // الأساسي
  static const Color lavender300 = Color(0xFFCBBCEB);
  static const Color lavender400 = Color(0xFFA999DA);
  static const Color lavender500 = Color(0xFF9370DB);
  static const Color lavender600 = Color(0xFF7B5CB8);
  static const Color lavender700 = Color(0xFF634996);
  static const Color lavender800 = Color(0xFF4B3774);
  static const Color lavender900 = Color(0xFF332552);

  // Grayscale
  static const Color gray50 = Color(0xFFF2F3F3);
  static const Color gray100 = Color(0xFFE4E6E7);
  static const Color gray200 = Color(0xFFCACCCE);
  static const Color gray300 = Color(0xFFAEB5B6);
  static const Color gray400 = Color(0xFF949D9E);
  static const Color gray500 = Color(0xFF5E5556);
  static const Color gray600 = Color(0xFF61646B);
  static const Color gray700 = Color(0xFF494F50);
  static const Color gray800 = Color(0xFF313535);
  static const Color gray900 = Color(0xFF1B1A1B);

  // Orange (accent)
  static const Color orange50 = Color(0xFFFFE6E7);
  static const Color orange75 = Color.fromARGB(255, 255, 253, 248);
  static const Color orange100 = Color(0xFFFDECCE);
  static const Color orange200 = Color(0xFFFAD9AE);
  static const Color orange300 = Color(0xFFFBC76D);
  static const Color orange400 = Color(0xFFF5B53D);
  static const Color orange500 = Color(0xFFF4A91F);
  static const Color orange600 = Color(0xFFC2920A);
  static const Color orange700 = Color(0xFF926107);
  static const Color orange800 = Color(0xFF614105);
  static const Color orange900 = Color(0xFF312002);
  static const Color orange1000 = Color.fromARGB(255, 23, 15, 0);

  // Additional Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFFF0000);
  static const Color pink = Color(0xffF83758);
  static const Color green = Color(0xFF00FF00);
  static const Color blue = Color(0xFF0000FF);
  static const Color yellow = Color(0xFFFFFF00);
  static const Color purple = Color(0xFF800080);
  static const Color teal = Color(0xFF008080);
  static const Color brown = Color(0xFFA52A2A);

  // Dynamic color based on theme brightness

  static Color inverseThemeColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? black : white;
  static Color themeColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? white : black;
}
