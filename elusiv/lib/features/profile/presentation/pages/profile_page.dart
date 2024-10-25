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

                // Profile Picture
                const Positioned(
                  top: 150,
                  child: CircleAvatar(
                    backgroundColor: lightGray,
                    radius: 75,
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
                        color: Colors.deepPurple,
												borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),

									// Discord
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
												borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),

									// Instagram
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
												borderRadius: BorderRadius.circular(25),
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
