import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movemate_ui/presentation/core/theme/app_colors.dart';
import 'package:movemate_ui/presentation/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
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
          fillColor: Theme.of(context).colorScheme.onPrimary,
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
      ),
      home: const HomeView(),
    );
  }
}
