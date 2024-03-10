import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_chat_app/view/screens/authentication/authentication_screen.dart';
import 'package:sample_chat_app/view/screens/error/error_screen.dart';
import 'package:sample_chat_app/view/screens/root/root_screen.dart';

part 'app_routes.g.dart';

/// Error
class ErrorRoute extends GoRouteData {
  ErrorRoute({required this.e});

  final Exception e;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ErrorScreen(error: e);
}

/// Root
@TypedGoRoute<RootRoute>(
  path: '/',
  routes: [
    TypedGoRoute<AuthenticationRoute>(path: 'auth'),
  ],
)
class RootRoute extends GoRouteData {
  const RootRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const RootScreen();
}

/// Authentication
class AuthenticationRoute extends GoRouteData {
  const AuthenticationRoute({this.from});

  final String? from;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      transitionsBuilder: fadeTransitionsBuilder,
      child: const AuthenticationScreen(),
    );
  }
}

Widget fadeTransitionsBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) =>
    FadeTransition(
      opacity: animation,
      child: child,
    );
