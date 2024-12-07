import 'dart:math';
import 'package:flutter/material.dart';

class CreateGamePage extends StatefulWidget {
  const CreateGamePage({super.key});

  @override
  _CreateGamePageState createState() => _CreateGamePageState();
}

class _CreateGamePageState extends State<CreateGamePage> {
  final TextEditingController _gameNameController = TextEditingController();
  final List<String> _gameTypes = ['Assassin', 'Zombie Tag'];
  String _selectedGameType = 'Assassin';
  bool _isPublic = true;
  String _randomCode = '';

  // Function to generate a random 6-letter string
  String _generateRandomCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(6, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Game Name Input
            TextField(
              controller: _gameNameController,
              decoration: const InputDecoration(
                labelText: 'Game Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Game Type Dropdown
            DropdownButtonFormField<String>(
              value: _selectedGameType,
              items: _gameTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedGameType = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Game Type',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Public/Private Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Public Game'),
                Switch(
                  value: _isPublic,
                  onChanged: (value) {
                    setState(() {
                      _isPublic = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Random Code Display
            if (_randomCode.isNotEmpty)
              Text(
                'Game Code: $_randomCode',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

            const SizedBox(height: 16),

            // Generate Code Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _randomCode = _generateRandomCode();
                  });
                },
                child: const Text('Generate Game Code'),
              ),
            ),

            const Spacer(),

            // Create Game Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_gameNameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter a game name')),
                    );
                  } else {
                    // Save or handle game creation logic
                    print('Game Created:');
                    print('Name: ${_gameNameController.text}');
                    print('Type: $_selectedGameType');
                    print('Public: $_isPublic');
                    print('Code: $_randomCode');
                  }
                },
                child: const Text('Create Game'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
