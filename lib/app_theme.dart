// lib/theme/app_theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF2083B8),
    scaffoldBackgroundColor: const Color(0xFFBEDAE1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF2083B8),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2083B8),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    cardColor: const Color(0xFFBEDAE1),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2083B8),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark();
}
