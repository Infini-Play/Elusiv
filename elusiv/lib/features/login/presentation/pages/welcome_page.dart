import 'package:elusiv/core/localization/string_extensions.dart';
import 'package:elusiv/core/navigation/routing.dart';
import 'package:elusiv/features/login/presentation/widgets/login_register_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {

    void goLoginPage() {
      context.goNamed(AppRoute.loginPage.name);
    }

    void goRegistrationPage() {
      context.goNamed(AppRoute.registrationPage.name);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            LoginRegisterButton(
              onTap: goLoginPage,
              message: 'Login'.hardcoded,
              elevation: 4,
            ),

            const SizedBox(height: 20),

            LoginRegisterButton(
              onTap: goRegistrationPage,
              message: 'Register'.hardcoded,
              elevation: 4,
              alternateColors: true,
            ),
          ],
        ),
      ),
    );
  }
}