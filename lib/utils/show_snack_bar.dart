import 'package:flutter/material.dart';

/// Show snack bar
Future<void> showSnackBar(
  BuildContext context,
  String message, {
  Color? color,
  Duration duration = const Duration(milliseconds: 2000),
}) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(
        SnackBar(
          duration: duration,
          backgroundColor: color,
          content: Text(
            message,
            textAlign: TextAlign.center,
          ),
        ),
      )
      .closed;
}

/// Show error snack bar
Future<void> showErrorSnackBar(
  BuildContext context,
  dynamic error, {
  Duration duration = const Duration(milliseconds: 4000),
}) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(
        SnackBar(
          duration: duration,
          backgroundColor: Theme.of(context).colorScheme.error,
          content: Text(
            '$error',
            textAlign: TextAlign.center,
          ),
        ),
      )
      .closed;
}
