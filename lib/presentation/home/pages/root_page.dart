import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import '../../../core/theme/app_pallete.dart';
import 'home_page.dart';
import 'profile_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      backgroundColor: AppPallete.backgroundBlack,
      tabs: [
        PersistentTabConfig(
          screen: HomePage(),
          item: ItemConfig(
            icon: Icon(Icons.home_filled),
            title: 'Home',
            activeForegroundColor: AppPallete.yellow,
          ),
        ),
        PersistentTabConfig(
          screen: ProfilePage(),
          item: ItemConfig(
            icon: Icon(Icons.person),
            title: 'Profile',
            activeForegroundColor: AppPallete.yellow,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) {
        return Style12BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(color: AppPallete.backgroundBlack),
        );
      },
    );
  }
}
