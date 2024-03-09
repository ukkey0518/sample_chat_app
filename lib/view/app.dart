import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_chat_app/constants/theme.dart';
import 'package:sample_chat_app/router/app_router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      title: 'Sample Chat App',
      routerConfig: ref.watch(goRouterProvider),
    );
  }
}
