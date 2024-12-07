import 'package:flutter/material.dart';

class JoinGamePage extends StatefulWidget {
  const JoinGamePage({super.key});

  @override
  _JoinGamePageState createState() => _JoinGamePageState();
}

class _JoinGamePageState extends State<JoinGamePage> {
  final TextEditingController _gameCodeController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();

  // Dummy list of public games
  final List<Map<String, String>> _publicGames = [
    {'name': 'Assassin Royale', 'type': 'Assassin', 'code': 'ABC123'},
    {'name': 'Zombie Hunt', 'type': 'Zombie Tag', 'code': 'ZOMBIE'},
    {'name': 'Last Stand', 'type': 'Assassin', 'code': 'STAND1'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join A Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Game Code Input
            TextField(
              controller: _gameCodeController,
              decoration: const InputDecoration(
                labelText: 'Game Code',
                border: OutlineInputBorder(),
                hintText: 'Enter the 6-letter code',
              ),
            ),
            const SizedBox(height: 16),

            // Display Name Input
            TextField(
              controller: _displayNameController,
              decoration: const InputDecoration(
                labelText: 'Display Name',
                border: OutlineInputBorder(),
                hintText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 16),

            // Join Game Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_gameCodeController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter a game code')),
                    );
                  } else if (_displayNameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter your display name')),
                    );
                  } else {
                    // Handle game joining logic
                    print('Joining Game:');
                    print('Code: ${_gameCodeController.text}');
                    print('Name: ${_displayNameController.text}');
                  }
                },
                child: const Text('Join Game'),
              ),
            ),

            const SizedBox(height: 24),

            // Public Games List
            const Text(
              'Public Games',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: _publicGames.length,
                itemBuilder: (context, index) {
                  final game = _publicGames[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(game['name'] ?? ''),
                      subtitle: Text('Type: ${game['type']}'),
                      trailing: Text(
                        game['code'] ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () {
                        // Autofill the game code when a public game is tapped
                        setState(() {
                          _gameCodeController.text = game['code'] ?? '';
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
