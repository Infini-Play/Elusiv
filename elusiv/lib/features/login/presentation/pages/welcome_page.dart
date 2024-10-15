import 'package:elusiv/features/login/presentation/widgets/login_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            LoginButton(loginFunction: () {})
          ],
        ),
      ),
    );
  }
}