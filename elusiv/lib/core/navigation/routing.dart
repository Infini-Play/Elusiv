
import 'package:elusiv/features/authentication/presentation/pages/forgot_password_page.dart';
import 'package:elusiv/features/games/presentation/pages/games_page.dart';
import 'package:elusiv/features/home/presentation/pages/home_page.dart';
import 'package:elusiv/features/authentication/presentation/pages/login_page.dart';
import 'package:elusiv/features/authentication/presentation/pages/registration_page.dart';
import 'package:elusiv/features/authentication/presentation/pages/welcome_page.dart';
import 'package:elusiv/features/leaderboard/presentation/pages/leaderboard_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  welcomePage,
  loginPage,
  forgotPasswordPage,
  registrationPage,
  homePage,
  leaderboardPage,
  gamesPage,
}

final router = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(
      path: '/welcome',
      name: AppRoute.welcomePage.name,
      builder: (context, state) => const LeaderboardPage(),
      routes: [
        GoRoute(
          path: 'login',
          name: AppRoute.loginPage.name,
          builder: (context, state) => const LoginPage(),
          routes: [
            GoRoute(
              path: 'forgot_password',
              name: AppRoute.forgotPasswordPage.name,
              builder: (context, state) => const ForgotPasswordPage(),
            )
          ],
        ),
        GoRoute(
          path: 'registration',
          name: AppRoute.registrationPage.name,
          builder: (context, state) => const RegistrationPage(),
        ),
        GoRoute(
          path: 'leaderboard',
          name: AppRoute.leaderboardPage.name,
          builder: (context, state) => const LeaderboardPage(),
          pageBuilder: (context, state) => _noTransitionPage(const LeaderboardPage()),
        ),
        GoRoute(
          path: 'games',
          name: AppRoute.gamesPage.name,
          builder: (context, state) => const GamesPage(),
          pageBuilder: (context, state) => _noTransitionPage(const GamesPage()),
        ),
      ],
    ),
    GoRoute(
      path: '/',
      name: AppRoute.homePage.name,
      builder: (context, state) => const HomePage(),
    )
  ],
);

Page _noTransitionPage(Widget child) {
  return MaterialPage(
    child: child,
  );
}