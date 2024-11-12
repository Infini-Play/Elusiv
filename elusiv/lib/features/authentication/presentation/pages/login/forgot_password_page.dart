import 'package:elusiv/core/common_widgets/test_widgets/go_named_back_button_testing.dart';
import 'package:elusiv/core/common_widgets/themed_text_field.dart';
import 'package:elusiv/core/localization/string_extensions.dart';
import 'package:elusiv/core/navigation/routing.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:elusiv/features/authentication/presentation/widgets/login_register_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:elusiv/features/authentication/domain/auth_provider.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  void sendEmail(BuildContext context, TextEditingController emailController) {
    if (emailController.text.isNotEmpty) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.requestPasswordReset(emailController.text).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password reset email sent!'.hardcoded)),
        );
      }).catchError((error) {
        final errorString = error.toString();
        final start = errorString.indexOf('message:');
        final end = errorString.indexOf(",", start);
        final message = errorString.substring(start + 9, end);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      });
    }
  }

  void loginRedirect(BuildContext context) {
    context.goNamed(AppRoute.loginPage.name);
  }

  Widget wrap(Widget widget, double height) {
    return SizedBox(
      height: height,
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final width = MediaQuery.of(context).size.width * 0.75;
    const double heightPerObject = 75;

    final goBackText = Text(
      'Back to Login'.hardcoded,
      style: clickableStyleMedium,
    );

    return Scaffold(
      appBar: GoNamedBackButtonTesting(name: AppRoute.welcomePage.name),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
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
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    wrap(
                        Text(
                          'Forgot your password?'.hardcoded,
                          style: titleStyleMedium,
                        ),
                        heightPerObject),
                    wrap(
                        ThemedTextField(
                          hintText: 'Email'.hardcoded,
                          controller: emailController,
                        ),
                        heightPerObject),
                    wrap(
                        LoginRegisterButton(
                          onTap: () => sendEmail(context, emailController),
                          message: 'Send Reset Email'.hardcoded,
                          textStyle: titleStyleMedium,
                          padding: 4,
                          elevation: 4,
                        ),
                        heightPerObject),
                  ],
                ),
                const SizedBox(height: 10),
                wrap(
                    GestureDetector(
                      onTap: () => loginRedirect(context),
                      child: goBackText,
                    ),
                    heightPerObject)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
