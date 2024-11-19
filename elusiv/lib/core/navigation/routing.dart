import 'package:elusiv/features/authentication/presentation/pages/login/forgot_password_page.dart';
import 'package:elusiv/features/authentication/presentation/pages/login/password_reset_page.dart';
import 'package:elusiv/features/authentication/presentation/pages/register/additional_info_page.dart';
import 'package:elusiv/features/authentication/presentation/pages/register/verify_email_page.dart';
import 'package:elusiv/features/home/presentation/pages/home_page.dart';
import 'package:elusiv/features/authentication/presentation/pages/login/login_page.dart';
import 'package:elusiv/features/authentication/presentation/pages/register/registration_page.dart';
import 'package:elusiv/features/authentication/presentation/pages/welcome_page.dart';
import 'package:elusiv/features/profile/presentation/pages/profile_page.dart';
import 'package:elusiv/features/profile/presentation/pages/profile_settings_page.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  welcomePage,
  loginPage,
  forgotPasswordPage,
  registrationPage,
  homePage,
  forgotPassword,
  passwordReset,
  verifyEmail,
  additionalInfo, 
  profilePage, 
  profileSettingsPage
}

final router = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(
      path: '/welcome',
      name: AppRoute.welcomePage.name,
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/login',
      name: AppRoute.loginPage.name,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/forgot_password',
      name: AppRoute.forgotPassword.name,
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: '/password_reset',
      name: AppRoute.passwordReset.name,
      builder: (context, state) => const PasswordResetPage(),
    ),
    GoRoute(
      path: '/registration',
      name: AppRoute.registrationPage.name,
      builder: (context, state) => const RegistrationPage(),
    ),
    GoRoute(
      path: '/profilePage',
      name: AppRoute.profilePage.name,
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/profileSettingsPage',
      name: AppRoute.profileSettingsPage.name,
      builder: (context, state) => const ProfileSettingsPage(),
    ),
    GoRoute(
      path: '/verify_email',
      name: AppRoute.verifyEmail.name,
      builder: (context, state) {
        final extra = state.extra as Map<String, String>?;
        final email = extra?['email'];
        final password = extra?['password'];
        return VerifyEmailPage(email: email ?? '', password: password ?? '');
      },
    ),
    GoRoute(
      path: '/additional_info',
      name: AppRoute.additionalInfo.name,
      builder: (context, state) => const AdditionalInfoPage(),
    ),
    GoRoute(
      path: '/',
      name: AppRoute.homePage.name,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
