
import 'package:elusiv/features/home/presentation/pages/home_page.dart';
import 'package:elusiv/features/login/presentation/pages/login_page.dart';
import 'package:elusiv/features/login/presentation/pages/registration_page.dart';
import 'package:elusiv/features/login/presentation/pages/verified_page.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  welcomePage,
  loginPage,
  registrationPage,
  homePage,
}

final router = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(
      path: '/welcome',
      name: AppRoute.welcomePage.name,
      builder: (context, state) => const VerifiedPage(),
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
      ],
    ),
    GoRoute(
      path: '/',
      name: AppRoute.homePage.name,
      builder: (context, state) => const HomePage(),
    )
  ],
);