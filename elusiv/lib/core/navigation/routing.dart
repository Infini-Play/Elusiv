import 'package:elusiv/features/home/presentation/pages/home_page.dart';
import 'package:elusiv/features/login/presentation/pages/login_page.dart';
import 'package:elusiv/features/login/presentation/pages/registration_page.dart';
import 'package:elusiv/features/login/presentation/pages/welcome_page.dart';
import 'package:elusiv/features/profile/presentation/pages/profile_settings_page.dart';
import 'package:elusiv/features/profile/presentation/pages/profile_page.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  welcomePage,
  loginPage,
  registrationPage,
  homePage,
  profilePage,
  profileSettingsPage,
}

final router = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(
      path: '/welcome',
      name: AppRoute.welcomePage.name,
      builder: (context, state) => const WelcomePage(),
      routes: [
        GoRoute(
          path: 'login',
          name: AppRoute.loginPage.name,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: 'registration',
          name: AppRoute.registrationPage.name,
          builder: (context, state) => const RegistrationPage(),
        ),
        GoRoute(
          path: 'profile',
          name: AppRoute.profilePage.name,
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: 'profileSettings',
          name: AppRoute.profileSettingsPage.name,
          builder: (context, state) => const ProfileSettingsPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/',
      name: AppRoute.homePage.name,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
