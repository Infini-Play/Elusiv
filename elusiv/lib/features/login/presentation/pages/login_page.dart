import 'package:elusiv/core/common_widgets/test_widgets/go_named_back_button_testing.dart';
import 'package:elusiv/core/common_widgets/themed_text_field.dart';
import 'package:elusiv/core/localization/string_extensions.dart';
import 'package:elusiv/core/navigation/routing.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:elusiv/features/login/presentation/widgets/login_register_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  void login(BuildContext context) {

  }

  void forgotPasswordRedirect(BuildContext context) {

  }

  void registerRedirect(BuildContext context) {
    context.goNamed(AppRoute.registrationPage.name);
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
    final width = MediaQuery.of(context).size.width * 0.75;
    const double heightPerObject = 60;

    final signUpText = Text.rich(
      TextSpan(
        text: 'Don\'t have an account? '.hardcoded,
        style: textStyle,
        children: <TextSpan>[
          TextSpan(
            text: 'Register now'.hardcoded,
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
              
                  wrap(Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => forgotPasswordRedirect(context),
                        child: Text(
                          'Forgot Password?'.hardcoded,
                          style: textStyle,
                        ),
                      ),
                    ],
                  ), heightPerObject),
              
                  wrap(LoginRegisterButton(
                    onTap: () => login(context),
                    message: 'Login'.hardcoded,
                    textStyle: titleStyleMedium,
                    padding: 4,
                    elevation: 4,
                  ), heightPerObject),
              
                ],
              ),

              wrap(GestureDetector(
                onTap: () => registerRedirect(context),
                child: signUpText,
              ), heightPerObject)

            ],
          ),
        ),
      ),
    );
  }
}