import 'package:elusiv/core/common_widgets/themed_container.dart';
import 'package:elusiv/core/localization/string_extensions.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final void Function()? loginFunction;

  const LoginButton({
    super.key,
    required this.loginFunction,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // 80% of screenWidth
    final buttonWidth = screenWidth * 0.75;
    return TextButton(
      onPressed: loginFunction, 
      child: ThemedContainer(
        width: buttonWidth,
        alternateColors: true,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Login'.hardcoded,
              style: TextStyle(
                fontSize: 36,
              ),
            ),
          ),
        ),
      ),
    );
  }
}