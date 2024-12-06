import 'package:elusiv/core/common_widgets/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';

class GamePageView extends StatelessWidget {
  final List<Map<String, String>> games;
  final int initialIndex;

  const GamePageView({
    required this.games,
    required this.initialIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Details'),
      ),
      body: PageView.builder(
        controller: PageController(initialPage: initialIndex),
        itemCount: games.length,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    games[index]['title']!,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    games[index]['description']!,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
