import 'package:elusiv/core/common_widgets/test_widgets/go_named_back_button_testing.dart';
import 'package:elusiv/core/common_widgets/themed_text_field.dart';
import 'package:elusiv/core/localization/string_extensions.dart';
import 'package:elusiv/core/navigation/routing.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:elusiv/features/authentication/presentation/widgets/login_register_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  void sendEmail(BuildContext context, TextEditingController emailController) {
    // Only perform an action if the email and password fields have text
    if (emailController.text.isNotEmpty) {

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
    const double heightPerObject = 60;

    final goBackText = Text(
      'Back to Login'.hardcoded,
      style: clickableStyleLarge,
    );


    return Scaffold(
      appBar: GoNamedBackButtonTesting(name: AppRoute.welcomePage.name),
      body: Center(
        child: SizedBox(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              wrap(Text(
                'LOGO GOES HERE'.hardcoded
                ), heightPerObject
              ),


              Column(
                children: [

                  wrap(Text(
                    'Forgot your password?'.hardcoded,
                    style: titleStyleMedium,
                  ), heightPerObject),

                  wrap(Text(
                    'Enter your email address below and we\'ll send you instructions to reset your password.'.hardcoded,
                    textAlign: TextAlign.center,
                    style: textStyleMedium
                  ), heightPerObject),

                ],
              ),

              

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              
                  wrap(ThemedTextField(
                    hintText: 'Email'.hardcoded,
                    controller: emailController,
                  ), heightPerObject),
              
                  wrap(LoginRegisterButton(
                    onTap: () => sendEmail(context, emailController),
                    message: 'Send Email'.hardcoded,
                    textStyle: titleStyleMedium,
                    padding: 4,
                    elevation: 4,
                  ), heightPerObject),
              
                ],
              ),

              wrap(GestureDetector(
                onTap: () => loginRedirect(context),
                child: goBackText,
              ), heightPerObject)

            ],
          ),
        ),
      ),
    );
  }
}