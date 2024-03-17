import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_chat_app/view/screens/root/root_screen.dart';

part 'root_routes.g.dart';

@TypedGoRoute<RootRoute>(
  path: '/',
)
class RootRoute extends GoRouteData {
  const RootRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const RootScreen();
}
