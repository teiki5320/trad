import 'package:flutter/material.dart';

class AppColors {
  // Accents (communs)
  static const Color gold = Color(0xFFD4AF37);
  static const Color green = Color(0xFF1D9E75);

  // Thème sombre
  static const Color darkBg = Color(0xFF121212);
  static const Color darkCard = Color(0xFF1E1E1E);
  static const Color darkText = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB0B0B0);

  // Thème clair
  static const Color lightBg = Color(0xFFF5F5F5);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightText = Color(0xFF1A1A1A);
  static const Color lightTextSecondary = Color(0xFF666666);
}

class AppTheme {
  static const double radius = 12.0;
  static const double buttonMinHeight = 48.0;

  static ThemeData get dark {
    const base = ColorScheme.dark(
      primary: AppColors.gold,
      secondary: AppColors.green,
      surface: AppColors.darkCard,
    );
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: base,
      scaffoldBackgroundColor: AppColors.darkBg,
      cardColor: AppColors.darkCard,
      cardTheme: CardTheme(
        color: AppColors.darkCard,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBg,
        foregroundColor: AppColors.darkText,
        elevation: 0,
        centerTitle: false,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkCard,
        selectedItemColor: AppColors.gold,
        unselectedItemColor: AppColors.darkTextSecondary,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.darkText),
        bodyMedium: TextStyle(color: AppColors.darkText),
        bodySmall: TextStyle(color: AppColors.darkTextSecondary),
        titleLarge: TextStyle(color: AppColors.darkText, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(color: AppColors.darkText, fontWeight: FontWeight.w600),
        labelLarge: TextStyle(color: AppColors.darkText),
      ),
      iconTheme: const IconThemeData(color: AppColors.darkText),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkCard,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: AppColors.gold, width: 1.5),
        ),
        hintStyle: const TextStyle(color: AppColors.darkTextSecondary),
      ),
      dividerColor: const Color(0xFF2A2A2A),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.darkCard,
        selectedColor: AppColors.gold,
        labelStyle: const TextStyle(color: AppColors.darkText),
        secondaryLabelStyle: const TextStyle(color: Colors.black),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: Colors.black,
          minimumSize: const Size.fromHeight(buttonMinHeight),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
      ),
    );
  }

  static ThemeData get light {
    const base = ColorScheme.light(
      primary: AppColors.gold,
      secondary: AppColors.green,
      surface: AppColors.lightCard,
    );
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorScheme: base,
      scaffoldBackgroundColor: AppColors.lightBg,
      cardColor: AppColors.lightCard,
      cardTheme: CardTheme(
        color: AppColors.lightCard,
        elevation: 1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightBg,
        foregroundColor: AppColors.lightText,
        elevation: 0,
        centerTitle: false,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightCard,
        selectedItemColor: AppColors.gold,
        unselectedItemColor: AppColors.lightTextSecondary,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.lightText),
        bodyMedium: TextStyle(color: AppColors.lightText),
        bodySmall: TextStyle(color: AppColors.lightTextSecondary),
        titleLarge: TextStyle(color: AppColors.lightText, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(color: AppColors.lightText, fontWeight: FontWeight.w600),
        labelLarge: TextStyle(color: AppColors.lightText),
      ),
      iconTheme: const IconThemeData(color: AppColors.lightText),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightCard,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: AppColors.gold, width: 1.5),
        ),
        hintStyle: const TextStyle(color: AppColors.lightTextSecondary),
      ),
      dividerColor: const Color(0xFFE0E0E0),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.lightCard,
        selectedColor: AppColors.gold,
        labelStyle: const TextStyle(color: AppColors.lightText),
        secondaryLabelStyle: const TextStyle(color: Colors.black),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: Colors.black,
          minimumSize: const Size.fromHeight(buttonMinHeight),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
      ),
    );
  }
}
