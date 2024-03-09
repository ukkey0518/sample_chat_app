import 'dart:io';

import 'package:flutter/foundation.dart';

mixin Env {
  static const String firebaseProjectId =
      String.fromEnvironment('FIREBASE_PROJECT_ID');

  static String get firebaseApiKey {
    if (kIsWeb) {
      return const String.fromEnvironment('FIREBASE_API_KEY_WEB');
    }
    if (Platform.isAndroid) {
      return const String.fromEnvironment('FIREBASE_API_KEY_ANDROID');
    }
    if (Platform.isIOS) {
      return const String.fromEnvironment('FIREBASE_API_KEY_IOS');
    }
    throw UnsupportedError('Platform not supported');
  }

  static String get firebaseAppId {
    if (kIsWeb) {
      return const String.fromEnvironment('FIREBASE_APP_ID_WEB');
    }
    if (Platform.isAndroid) {
      return const String.fromEnvironment('FIREBASE_APP_ID_ANDROID');
    }
    if (Platform.isIOS) {
      return const String.fromEnvironment('FIREBASE_APP_ID_IOS');
    }
    throw UnsupportedError('Platform not supported');
  }

  static const String firebaseMessagingSenderId =
      String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID');
  static const String firebaseAuthDomain =
      String.fromEnvironment('FIREBASE_AUTH_DOMAIN');
  static const String firebaseStorageBucket =
      String.fromEnvironment('FIREBASE_STORAGE_BUCKET');
  static const String firebaseIosBundleId =
      String.fromEnvironment('FIREBASE_IOS_BUNDLE_ID');
}
