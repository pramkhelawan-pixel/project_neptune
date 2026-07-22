import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/pages/login_page.dart';
import '../../features/authentication/presentation/pages/signup_page.dart';
import '../../features/authentication/presentation/pages/splash_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../auth/auth_refresh_notifier.dart';
import '../services/supabase_service.dart';
import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static final AuthRefreshNotifier _authRefreshNotifier =
  AuthRefreshNotifier();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,

    refreshListenable: _authRefreshNotifier,

    redirect: (context, state) {
      final session = SupabaseService.client.auth.currentSession;

      final isLoggedIn = session != null;

      final location = state.matchedLocation;

      final isSplash = location == AppRoutes.splash;
      final isLogin = location == AppRoutes.login;
      final isSignup = location == AppRoutes.signup;

      if (!isLoggedIn) {
        if (isLogin || isSignup) {
          return null;
        }

        return AppRoutes.login;
      }

      if (isLoggedIn &&
          (isSplash || isLogin || isSignup)) {
        return AppRoutes.home;
      }

      return null;
    },

    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
    ],

    errorBuilder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Navigation Error'),
        ),
        body: Center(
          child: Text(
            'Page not found:\n${state.uri}',
            textAlign: TextAlign.center,
          ),
        ),
      );
    },
  );
}