import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:elusiv/core/common_widgets/themed_confetti_widget.dart';
import 'package:flutter/material.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final _controller = ConfettiController(duration: const Duration(seconds: 3));
  
  @override 
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override void initState() {
    super.initState();
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        const Scaffold(
          body: Center(
            child: Text(
              'Account Verified!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              ),
          ),
        ),
        ThemedConfettiWidget(
          controller: _controller,
          blastDirection: pi / 2,
          numberOfParticles: 100,
        )
      ],
    );
  }
}