
import 'package:elusiv/features/authentication/presentation/pages/forgot_password_page.dart';
import 'package:elusiv/features/games/presentation/pages/create_game_page.dart';
import 'package:elusiv/features/games/presentation/pages/game_page_view.dart';
import 'package:elusiv/features/games/presentation/pages/games_page.dart';
import 'package:elusiv/features/games/presentation/pages/join_game_page.dart';
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
  createGamesPage,
  joinGamePage,
}

final router = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(
      path: '/welcome',
      name: AppRoute.welcomePage.name,
      builder: (context, state) => GamesPage(),
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
          builder: (context, state) => GamesPage(),
          pageBuilder: (context, state) => _noTransitionPage(GamesPage()),
        ),
        GoRoute(
          path: 'createGame',
          name: AppRoute.createGamesPage.name,
          builder: (context, state) => const CreateGamePage(),
          pageBuilder: (context, state) => _noTransitionPage(const CreateGamePage()),
        ),
        GoRoute(
          path: 'joinGame',
          name: AppRoute.joinGamePage.name,
          builder: (context, state) => const JoinGamePage(),
          pageBuilder: (context, state) => _noTransitionPage(const JoinGamePage()),
        ),
        GoRoute(
          path: '/game/:id',
          builder: (context, state) {
            final id = int.tryParse(state.pathParameters['id']!) ?? 0;
            final games = state.extra as List<Map<String, String>>;
            return GamePageView(
              games: games,
              initialIndex: id,
            );
          },
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