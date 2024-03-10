import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_chat_app/constants/theme.dart';
import 'package:sample_chat_app/l10n/l10n.dart';
import 'package:sample_chat_app/router/app_router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Sample Chat App',
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      routerConfig: ref.watch(goRouterProvider),
    );
  }
}
