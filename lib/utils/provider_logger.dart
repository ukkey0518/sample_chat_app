// ignore_for_file: always_put_control_body_on_new_line

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_chat_app/utils/debug_log.dart';
import 'package:sample_chat_app/utils/extensions/string_extensions.dart';

class ProviderLogger extends ProviderObserver {
  static bool disabled = false;
  static bool namedOnly = true;
  static int maxStateLength = 50;

  static List<String> onlyMatched = [];

  static String? _limitedValueString(Object? value) {
    return value?.toString().ellipsis(maxStateLength);
  }

  static void logInit(String providerName, Object? value) {
    if (disabled) return;
    if (onlyMatched.isNotEmpty && !onlyMatched.contains(providerName)) return;
    debugLog(
      '[Provider Init] $providerName { '
      'value: ${_limitedValueString(value)} '
      '}',
    );
  }

  static void logUpdate(
    String providerName,
    Object? previousValue,
    Object? newValue,
  ) {
    if (disabled) return;
    if (onlyMatched.isNotEmpty && !onlyMatched.contains(providerName)) return;
    debugLog(
      '[Provider Update] $providerName { '
      'prev: ${_limitedValueString(previousValue)}, '
      'new: ${_limitedValueString(newValue)} '
      '}',
    );
  }

  static void logDispose(String providerName) {
    if (disabled) return;
    if (onlyMatched.isNotEmpty && !onlyMatched.contains(providerName)) return;
    debugLog('[Provider Dispose] $providerName');
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (namedOnly && name == null) return;
    logInit('${name ?? provider.runtimeType}', value);
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (namedOnly && provider.name == null) return;
    logUpdate('${name ?? provider.runtimeType}', previousValue, newValue);
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (namedOnly && name == null) return;
    logDispose('${name ?? provider.runtimeType}');
  }
}
