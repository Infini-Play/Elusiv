import 'package:elusiv/core/common_widgets/containers/themed_container_no_borders.dart';
import 'package:elusiv/core/common_widgets/test_widgets/go_named_back_button_testing.dart';
import 'package:elusiv/core/navigation/routing.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    void goProfileSettingsPage() {
      context.goNamed(AppRoute.profileSettingsPage.name);
    }

    return Scaffold(
      appBar: GoNamedBackButtonTesting(name: AppRoute.welcomePage.name),
      body: Center(
        child: Column(
          children: [
            // Top part of the screen with pic and basic info
            const Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Top part primary colored background
                ThemedContainerNoBorders(height: 225),

                // Text containing Profile name
                Positioned(
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

                // Text containing username
                Positioned(
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

                // Space for profile picture
                Positioned(
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

            const SizedBox(height: 75),

            // Containers containing user's in game statistics
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // Wins
                  ThemedContainerNoBorders(
                    height: 110,
                    width: 110,
                    borderRadius: BorderRadius.circular(25),
                    alternateColors: true,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Number of wins to be made dynamic later
                        Padding(
                          padding: EdgeInsets.only(
                              top: 8.0, bottom: 0.0), // Reduced bottom padding
                          child: Text(
                            '100',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                            top: 0.0,
                          ), // Added top padding
                          child: Text(
                            'Wins',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Losses
                  ThemedContainerNoBorders(
                    height: 110,
                    width: 110,
                    borderRadius: BorderRadius.circular(25),                    
                    alternateColors: true,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Number of Losses to be made dynamic later
                        Padding(
                          padding: EdgeInsets.only(
                              top: 8.0, bottom: 0.0), // Reduced bottom padding
                          child: Text(
                            '0',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                            top: 0.0,
                          ), // Added top padding
                          child: Text(
                            'Losses',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Kills
                  ThemedContainerNoBorders(
                    height: 110,
                    width: 110,
                    borderRadius: BorderRadius.circular(25),                    
                    alternateColors: true,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Number of Kills to be made dynamic later
                        Padding(
                          padding: EdgeInsets.only(
                              top: 8.0, bottom: 0.0), // Reduced bottom padding
                          child: Text(
                            '52',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                            top: 0.0,
                          ), // Added top padding
                          child: Text(
                            'Kills',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Profile information
            Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  
                // Buttons below the game statistics
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: ThemedContainerNoBorders(
                      height: 60,
                      borderRadius: BorderRadius.circular(25),
                      alternateColors: true,
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

                  // Button to get to Profile Settings Page
                  GestureDetector(
                    onTap: goProfileSettingsPage,
                    child: ThemedContainerNoBorders(
                      height: 60,
                      borderRadius: BorderRadius.circular(25),
                      alternateColors: true,
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
                            'Edit Profile',
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
