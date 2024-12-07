import 'package:elusiv/core/common_widgets/nav_bar/nav_bar.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  final Map<String, List<Player>> leaderboards = {
    'Game 1': [
      Player(name: 'Alice', score: 150),
      Player(name: 'Bob', score: 120),
      Player(name: 'Charlie', score: 180),
    ],
    'Game 2': [
      Player(name: 'Alice', score: 90),
      Player(name: 'Bob', score: 140),
      Player(name: 'Charlie', score: 100),
    ],
    'Game 3': [
      Player(name: 'Alice', score: 170),
      Player(name: 'Bob', score: 160),
      Player(name: 'Charlie', score: 180),
    ],
    'Game 4': [
      Player(name: 'Alice', score: 110),
      Player(name: 'Bob', score: 130),
      Player(name: 'Charlie', score: 125),
    ],
    'Game 5': [
      Player(name: 'Alice', score: 200),
      Player(name: 'Bob', score: 190),
      Player(name: 'Charlie', score: 210),
    ],
  };

  String selectedGame = 'Game 1';

  @override
  Widget build(BuildContext context) {
    List<Player> players = List.from(leaderboards[selectedGame]!);
    players.sort((a, b) => b.score.compareTo(a.score));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 80), // Subsidizing the space where an app bar would be
            const Text(
              'Active Games',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Dropdown to select the game
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: primary, width: 2),
                ),
                child: DropdownButton<String>(
                  value: selectedGame,
                  isExpanded: true, // Ensures it takes the full width
                  iconSize: 30, // Increases the size of the dropdown icon
                  dropdownColor: secondary,
                  style: const TextStyle(fontSize: 20, color: offWhite), // Larger font size
                  items: leaderboards.keys
                      .map((game) => DropdownMenuItem(
                            value: game,
                            child: Text(game),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGame = value!;
                    });
                  },
                  underline: const SizedBox(), // Removes the default underline
                ),
              ),
            ),
            // Leaderboard list
            Expanded(
              child: ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  final player = players[index];
                  return ListTile(
                    leading: Text(
                      '#${index + 1}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Increased text size
                    ),
                    title: Text(
                      player.name,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: primary), // Larger font for player name
                    ),
                    trailing: Text(
                      player.score.toString(),
                      style: const TextStyle(fontSize: 18, color: primary), // Larger font for score
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}

class Player {
  final String name;
  final int score;

  Player({required this.name, required this.score});
}