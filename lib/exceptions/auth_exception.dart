import 'package:flutter/material.dart';

@immutable
class AuthException implements Exception {
  const AuthException(this.message, [this._extra]);

  final String message;
  final Map<String, dynamic>? _extra;

  Map<String, dynamic> get extra => _extra ?? {};

  @override
  String toString() {
    final buffer = StringBuffer('AuthException: $message');
    if (_extra != null && _extra.isNotEmpty) {
      buffer.write(' $_extra');
    }
    return buffer.toString();
  }
}
