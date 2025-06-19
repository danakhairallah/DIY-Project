// lib/theme/app_theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFFC62828), // نهدي غامق
    scaffoldBackgroundColor: const Color(0xFFFFCDD2), // زهري فاتح
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFC62828), // زهري غامق
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFC62828),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    cardColor: const Color(0xFFFFCDD2), // لون الكروت - نهدي فاتح
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFFC62828),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark();
}
