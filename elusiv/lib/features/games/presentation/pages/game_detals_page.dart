import 'dart:async';
import 'package:flutter/material.dart';

class GameDetailsPage extends StatefulWidget {
  final String gameName;
  final String gameType;
  final int totalParticipants;
  final int durationInSeconds; // Total duration of the game in seconds

  const GameDetailsPage({
    super.key, 
    required this.gameName,
    required this.gameType,
    required this.totalParticipants,
    required this.durationInSeconds,
  });

  @override
  _GameDetailsPageState createState() => _GameDetailsPageState();
}

class _GameDetailsPageState extends State<GameDetailsPage> {
  late int _remainingSeconds;
  late Timer _timer;
  int _playerScore = 0; // Example player score (update this dynamically as needed)

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.durationInSeconds;
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Game Name
            Text(
              widget.gameName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Game Type
            Text(
              'Type: ${widget.gameType}',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),

            // Total Participants
            Text(
              'Participants: ${widget.totalParticipants}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),

            // Remaining Duration
            Row(
              children: [
                const Text(
                  'Remaining Time:',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 8),
                Text(
                  _formatTime(_remainingSeconds),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Player's Total Score
            Text(
              'Your Score: $_playerScore',
              style: const TextStyle(fontSize: 18, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
