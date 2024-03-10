import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_chat_app/constants/env.dart';
import 'package:sample_chat_app/utils/debug_log.dart';
import 'package:sample_chat_app/utils/provider_logger.dart';
import 'package:sample_chat_app/view/app.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize Firebase
    await Firebase.initializeApp(
      options: FirebaseOptions(
        projectId: Env.firebaseProjectId,
        apiKey: Env.firebaseApiKey,
        appId: Env.firebaseAppId,
        messagingSenderId: Env.firebaseMessagingSenderId,
        authDomain: Env.firebaseAuthDomain,
        storageBucket: Env.firebaseStorageBucket,
        iosBundleId: Env.firebaseIosBundleId,
      ),
    );

    // Run the app
    runApp(
      ProviderScope(
        observers: [ProviderLogger()],
        child: const App(),
      ),
    );
  }, (error, stack) {
    debugLog('runZonedGuarded: Caught error: $error');
    debugLog(stack);
  });
}
