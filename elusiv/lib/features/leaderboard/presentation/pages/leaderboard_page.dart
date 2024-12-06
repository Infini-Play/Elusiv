import 'package:flutter/material.dart';
import 'package:elusiv/core/common_widgets/nav_bar/nav_bar.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    const NavBar navBar = NavBar();
    
    return const Scaffold(
      body:  Center(
        child: Text('Leaderboard Page'),
      ),
      bottomNavigationBar: navBar,
    );
  }
}
