import 'package:elusiv/core/localization/string_extensions.dart';
import 'package:elusiv/core/navigation/routing.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:elusiv/features/authentication/presentation/widgets/login_register_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _isCheckingCredentials = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final hasValidCredentials = await checkStoredCredentials();
      if (hasValidCredentials) {
        context.goNamed(AppRoute.homePage.name);
      } else {
        setState(() {
          _isCheckingCredentials = false;
        });
      }
    });
  }

  Future<bool> checkStoredCredentials() async {
    final pb = Provider.of<PocketBase>(context, listen: false);
    //testing - invalidated the stored credentials
    pb.authStore.clear();
    // Check if the stored credentials are valid
    return pb.authStore.isValid;
  }

  @override
  Widget build(BuildContext context) {
    if (_isCheckingCredentials) {
      return Scaffold(
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
