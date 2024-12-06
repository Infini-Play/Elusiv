import 'package:elusiv/core/common_widgets/containers/themed_container.dart';
import 'package:elusiv/core/common_widgets/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GamesPage extends StatelessWidget {
  GamesPage({super.key});
  
  final List<Map<String, String>> games = [
    {'title': 'Game 1', 'description': 'Description of Game 1'},
    {'title': 'Game 2', 'description': 'Description of Game 2'},
    {'title': 'Game 3', 'description': 'Description of Game 3'},
    {'title': 'Game 4', 'description': 'Description of Game 4'},
    {'title': 'Game 5', 'description': 'Description of Game 5'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),  //Replacement for AppBar Space
            const Text(
              'Start A New Game',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      // Handle Create A Game
                    },
                    child: const Text('Create A Game'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      // Handle Join A Game
                    },
                    child: const Text('Join A Game'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),
            
            const Text(
              'Active Games',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
           
            const SizedBox(height: 10),
           
            Expanded(
              child: ThemedContainer(
                alternateColors: true,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: games.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16),
                            alignment: Alignment.centerLeft,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                              context.go(
                              '/game/$index',
                              extra: games,
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                games[index]['title']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                games[index]['description']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}