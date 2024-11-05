import 'package:elusiv/core/common_widgets/test_widgets/go_named_back_button_testing.dart';
import 'package:elusiv/core/navigation/routing.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

/*
 *  THINGS TO INCLUDE
 *      1. Profile Picture
 *      2. Username
 *      3. Profile name
 *      4. Friends?
 *      5. Phone Number?
 */

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GoNamedBackButtonTesting(name: AppRoute.welcomePage.name),
      body: Center(
        child: Column(
          children: [
            // Top part of the screen with pic and basic info
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Top part background
                Container(
                  color: lightMaroon,
                  height: 225,
                ),

                // Name text
                const Positioned(
                  top: 50,
                  child: Text(
                    'PROFILE NAME',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                // Username text
                const Positioned(
                  top: 95,
                  child: Text(
                    '@username',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                // Profile Picture
                const Positioned(
                  top: 150,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: lightGray,
                        radius: 75,
                      ),
                      Icon(
                        Icons.person,
                        size: 75,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 125),

            // Profile information
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Phone Number
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: lightGray,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Icon(
                              Icons.man,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 60),
                          Text(
                            'Friends',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Discord
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: lightGray,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Icon(
                              Icons.discord,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 60),
                          Text(
                            'Discord',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Phone Number
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: lightGray,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 60),
                          Text(
                            'Phone Number',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Settings
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: lightGray,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 60),
                          Text(
                            'Settings',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
