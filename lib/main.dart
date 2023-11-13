import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movemate_ui/application/calculate/calculate_chip_provider.dart';
import 'package:movemate_ui/application/shipment_history/shipment_tab_provider.dart';
import 'package:movemate_ui/presentation/calculate/calculate_view.dart';
import 'package:movemate_ui/presentation/core/theme/app_colors.dart';
import 'package:movemate_ui/presentation/home/home_view.dart';
import 'package:movemate_ui/presentation/shipment_history/shipment_history_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondaryColor,
          ),
        ),
      ),
      builder: (context, child) {
        PersistentTabController controller =
            PersistentTabController(initialIndex: 0);

        return HeroControllerScope.none(
          child: PersistentTabView(
            context,
            controller: controller,
            screens: _buildScreens(context),
            items: _navBarsItems(context),
            confineInSafeArea: true,
            backgroundColor: Theme.of(context)
                .colorScheme
                .onPrimary, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset:
                true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows:
                true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 600),
              curve: Curves.easeInOutCubic,
            ),
            navBarStyle: NavBarStyle
                .style3, // Choose the nav bar style with this property.
          ),
        );
      },
    );
  }

  List<Widget> _buildScreens(BuildContext context) {
    return [
      const HomeView(),
      ChangeNotifierProvider(
        create: (context) => CalculateChipProvider(),
        child: const CalculateView(),
      ),
      ChangeNotifierProvider(
        create: (context) => ShipmentTabProvider(),
        child: const ShipmentHistoryView(),
      ),
      const Placeholder(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ('Home'),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calculate_outlined),
        title: ('Calculate'),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.history_outlined),
        title: ('Shipment'),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline),
        title: ('Profile'),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
