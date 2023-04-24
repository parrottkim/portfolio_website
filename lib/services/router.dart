import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_website/screens/main/main_screen.dart';
import 'package:portfolio_website/screens/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/main',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: MainScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
  ],
);
