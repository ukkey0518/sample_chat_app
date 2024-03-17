import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_chat_app/view/screens/error/error_screen.dart';

class ErrorRoute extends GoRouteData {
  ErrorRoute({required this.error});

  final Exception error;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ErrorScreen(error: error);
}
