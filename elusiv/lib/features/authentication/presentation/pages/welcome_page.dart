import 'package:elusiv/core/localization/string_extensions.dart';
import 'package:elusiv/core/navigation/routing.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:elusiv/features/authentication/presentation/widgets/login_register_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:elusiv/features/authentication/domain/auth_provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  bool _isCheckingCredentials = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final hasValidCredentials = await checkStoredCredentials();
      if (hasValidCredentials) {
        if (!mounted) return;
        context.goNamed(AppRoute.homePage.name);
      } else {
        setState(() {
          _isCheckingCredentials = false;
        });
      }
    });
  }

  Future<bool> checkStoredCredentials() async {
    final authProvider = context.read<AuthProvider>();
    return authProvider.isUserAuthenticated();
  }

  @override
  Widget build(BuildContext context) {
    if (_isCheckingCredentials) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

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
            Image.asset(
              'assets/images/logo.jpg',
              width: 150,
              height: 150,
            ),

            const Text(
              'Elusiv',
              style: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 20),
            LoginRegisterButton(
              onTap: goLoginPage,
              message: 'Login'.hardcoded,
              textStyle: titleStyleLarge,
              padding: 8,
              elevation: 4,
            ),
            const SizedBox(height: 20),
            LoginRegisterButton(
              onTap: goRegistrationPage,
              message: 'Register'.hardcoded,
              textStyle: titleStyleLarge,
              padding: 8,
              elevation: 4,
              alternateColors: true,
            ),
          ],
        ),
      ),
    );
  }
}
