import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movemate_ui/presentation/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryColor,
        ),
        cardTheme: const CardTheme(
          surfaceTintColor: AppColors.containerColor,
          color: AppColors.containerColor,
        ),
        scaffoldBackgroundColor: AppColors.backgroundColor,
        fontFamily: GoogleFonts.roboto().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          primary: AppColors.primaryColor,
          onPrimary: AppColors.containerColor,
          secondary: AppColors.secondaryColor,
          tertiary: AppColors.tertiaryColor,
        ),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding: const EdgeInsets.all(10),
          fillColor: AppColors.containerColor,
          filled: true,
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.dividerColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondaryColor,
          ),
        ),
      );
}
