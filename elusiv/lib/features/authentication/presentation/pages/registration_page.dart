import 'package:elusiv/core/common_widgets/test_widgets/go_named_back_button_testing.dart';
import 'package:elusiv/core/common_widgets/themed_text_field.dart';
import 'package:elusiv/core/localization/string_extensions.dart';
import 'package:elusiv/core/navigation/routing.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:elusiv/features/authentication/presentation/widgets/login_register_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});


  void register(BuildContext context, TextEditingController usernameController, TextEditingController passwordController, TextEditingController confirmPasswordController) {
  
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
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final width = MediaQuery.of(context).size.width * 0.75;
    const double heightPerObject = 60;

    final loginText = Text.rich(
      TextSpan(
        text: 'Already have an account? '.hardcoded,
        style: textStyle,
        children: <TextSpan>[
          TextSpan(
            text: 'Login now'.hardcoded,
            style: clickableStyle,
          )
        ]
      )
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              
                  wrap(ThemedTextField(
                    hintText: 'Username'.hardcoded,
                    controller: usernameController,
                  ), heightPerObject),
              
                  wrap(ThemedTextField(
                    hintText: 'Password'.hardcoded,
                    controller: passwordController,
                  ), heightPerObject),

                  wrap(ThemedTextField(
                    hintText: 'Confirm Password'.hardcoded,
                    controller: confirmPasswordController,
                  ), heightPerObject),
              
                  wrap(LoginRegisterButton(
                    onTap: () => register(context, usernameController, passwordController, confirmPasswordController),
                    message: 'Register'.hardcoded,
                    textStyle: titleStyleMedium,
                    padding: 4,
                    elevation: 4,
                  ), heightPerObject),
              
                ],
              ),

              wrap(GestureDetector(
                onTap: () => loginRedirect(context),
                child: loginText,
              ), heightPerObject)

            ],
          ),
        ),
      ),
    );
  }
}