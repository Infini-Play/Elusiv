import 'package:elusiv/core/common_widgets/containers/themed_container_no_borders.dart';
import 'package:elusiv/core/navigation/routing.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'nav_bar_state.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarState = Provider.of<NavBarState>(context);

    return ThemedContainerNoBorders(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      alternateColors: true,
      child: GNav(
        selectedIndex: navBarState.selectedIndex,
        onTabChange: (index) {
          navBarState.setSelectedIndex(index);
          _navigateToPage(context, index);
        },
        gap: 4,
        activeColor: offWhite,
        iconSize: 24,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        tabMargin: const EdgeInsets.symmetric(vertical: 5),
        tabBackgroundColor: primary,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        tabs: const [
          GButton(
            icon: Icons.leaderboard,
            text: 'Leaderboard',
            textStyle: TextStyle()
          ),
          GButton(
            icon: Icons.gamepad,
            text: 'Games',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
      ),
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.goNamed(AppRoute.leaderboardPage.name);
        break;
      case 1:
        context.goNamed(AppRoute.gamesPage.name);
        break;
      case 2:
        context.goNamed(AppRoute.gamesPage.name);
        break;
      default:
        context.go('/');
    }
  }
}
