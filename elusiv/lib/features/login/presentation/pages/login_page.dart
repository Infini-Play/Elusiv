import 'package:elusiv/core/common_widgets/test_widgets/go_named_back_button_testing.dart';
import 'package:elusiv/core/common_widgets/themed_text_field.dart';
import 'package:elusiv/core/localization/string_extensions.dart';
import 'package:elusiv/core/navigation/routing.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final width = MediaQuery.of(context).size.width * 0.75;
    return Scaffold(
      appBar: GoNamedBackButtonTesting(name: AppRoute.welcomePage.name),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            ThemedTextField(
              width: width,
              hintText: 'Username'.hardcoded,
              controller: usernameController,
            ),
        
            ThemedTextField(
              width: width,
              hintText: 'Password'.hardcoded,
              controller: passwordController,
            ),
          ],
        ),
      ),
    );
  }
}