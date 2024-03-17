import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_chat_app/services/authentication_service.dart';
import 'package:sample_chat_app/view/screens/auth/auth_routes.dart'
    as auth_routes;
import 'package:sample_chat_app/view/screens/error/error_routes.dart';
import 'package:sample_chat_app/view/screens/root/root_routes.dart'
    as root_routes;

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final router = _Router();
  ref.onDispose(router.dispose);
  return router.goRouter;
}

class _Router {
  factory _Router() => _instance;

  _Router._internal() : _authStateNotifier = _AuthStateNotifier() {
    goRouter = GoRouter(
      debugLogDiagnostics: true,
      routes: [
        ...root_routes.$appRoutes,
        ...auth_routes.$appRoutes,
      ],
      initialLocation: const root_routes.RootRoute().location,
      errorBuilder: (context, state) =>
          ErrorRoute(error: state.error!).build(context, state),
      refreshListenable: _authStateNotifier,
      redirect: (context, state) {
        final matchedLocation = state.matchedLocation;
        final rootLocation = const root_routes.RootRoute().location;
        final authLocation = const auth_routes.AuthRoute().location;

        final signedIn = AuthenticationService.isSignedIn;

        if (!signedIn && matchedLocation != authLocation) {
          return matchedLocation == rootLocation
              ? const auth_routes.AuthRoute().location
              : auth_routes.AuthRoute(
                  from: Uri.encodeComponent(state.uri.toString()),
                ).location;
        }
        if (signedIn && matchedLocation == authLocation) {
          final from = state.uri.queryParameters['from'] ?? '';
          return from.isEmpty ? rootLocation : Uri.decodeComponent(from);
        }
        return null;
      },
    );
  }

  static final _Router _instance = _Router._internal();

  final ChangeNotifier _authStateNotifier;
  late final GoRouter goRouter;

  void dispose() => _authStateNotifier.dispose();
}

class _AuthStateNotifier extends ChangeNotifier {
  _AuthStateNotifier() {
    _subscription = AuthenticationService.isSignedInStream().listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription<bool> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
