import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_chat_app/router/build_fade_transition_page.dart';
import 'package:sample_chat_app/view/screens/auth/auth_screen.dart';

part 'auth_routes.g.dart';

@TypedGoRoute<AuthRoute>(
  path: '/auth',
)
class AuthRoute extends GoRouteData {
  const AuthRoute({this.from});

  final String? from;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      buildFadeTransitionPage(
        state: state,
        child: const AuthScreen(),
      );
}
