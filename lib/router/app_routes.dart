import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_chat_app/view/screens/error/error_screen.dart';
import 'package:sample_chat_app/view/screens/home/home_screen.dart';
import 'package:sample_chat_app/view/screens/sign_in/sign_in_screen.dart';

part 'app_routes.g.dart';

/// Error
class ErrorRoute extends GoRouteData {
  ErrorRoute({required this.e});

  final Exception e;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ErrorScreen(error: e);
}

/// Home
@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<SignInRoute>(path: 'sign_in'),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

/// SignIn
class SignInRoute extends GoRouteData {
  const SignInRoute({this.from});

  final String? from;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      transitionsBuilder: fadeTransitionsBuilder,
      child: const SignInScreen(),
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
