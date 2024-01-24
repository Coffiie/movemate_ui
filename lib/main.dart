import 'package:flutter/material.dart';
import 'package:movemate_ui/application/calculate/calculate_chip_provider.dart';
import 'package:movemate_ui/application/shipment_history/shipment_tab_provider.dart';
import 'package:movemate_ui/presentation/calculate/calculate_view.dart';
import 'package:movemate_ui/presentation/core/extensions/on_build_context.dart';
import 'package:movemate_ui/presentation/core/theme/app_theme.dart';
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
      theme: AppTheme.light,
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
            backgroundColor: context.colorScheme.onPrimary,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 600),
              curve: Curves.easeInOutCubic,
            ),
            navBarStyle: NavBarStyle.style3,
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
        activeColorPrimary: context.colorScheme.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calculate_outlined),
        title: ('Calculate'),
        activeColorPrimary: context.colorScheme.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.history_outlined),
        title: ('Shipment'),
        activeColorPrimary: context.colorScheme.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline),
        title: ('Profile'),
        activeColorPrimary: context.colorScheme.primary,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
