import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_chat_app/utils/provider_logger.dart';
import 'package:sample_chat_app/view/app.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [ProviderLogger()],
      child: const App(),
    ),
  );
}
