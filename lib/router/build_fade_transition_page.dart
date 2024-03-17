import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Page<void> buildFadeTransitionPage({
  required GoRouterState state,
  required Widget child,
}) =>
    CustomTransitionPage<void>(
      key: state.pageKey,
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: child,
    );
