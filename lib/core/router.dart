import 'package:client/screens/splash.dart';
import 'package:client/screens/tab_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/error.dart';
import '../screens/login.dart';
import '../screens/open.dart';
import '../screens/register.dart';

//! Router

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: <GoRoute>[
    GoRoute(path: '/', builder: (BuildContext context, GoRouterState state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (BuildContext context, GoRouterState state) => const LoginScreen()),
    GoRoute(path: '/register', builder: (BuildContext context, GoRouterState state) => const RegisterScreen()),
    GoRoute(path: '/error', builder: (BuildContext context, GoRouterState state) => const ErrorScreen()),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) => const TabManager(),
    ),
    GoRoute(
      path: '/open',
      builder: (BuildContext context, GoRouterState state) => const OpenScreen(),
    ),
  ],
);
