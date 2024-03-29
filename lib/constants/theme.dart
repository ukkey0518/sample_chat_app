import 'package:flutter/material.dart';

final baseTheme = ThemeData();

final appLightTheme = baseTheme.copyWith(
  colorScheme: lightColorScheme,
);

final appDarkTheme = baseTheme.copyWith(
  colorScheme: darkColorScheme,
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF506600),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD1EE7C),
  onPrimaryContainer: Color(0xFF161F00),
  secondary: Color(0xFF5B6147),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFDFE6C4),
  onSecondaryContainer: Color(0xFF181E09),
  tertiary: Color(0xFF785A00),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFDF9D),
  onTertiaryContainer: Color(0xFF251A00),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFEFCF4),
  onBackground: Color(0xFF1B1C17),
  surface: Color(0xFFFEFCF4),
  onSurface: Color(0xFF1B1C17),
  surfaceVariant: Color(0xFFE3E4D3),
  onSurfaceVariant: Color(0xFF46483C),
  outline: Color(0xFF76786B),
  onInverseSurface: Color(0xFFF3F1E9),
  inverseSurface: Color(0xFF30312C),
  inversePrimary: Color(0xFFB5D263),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF506600),
  outlineVariant: Color(0xFFC6C8B8),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFB5D263),
  onPrimary: Color(0xFF283500),
  primaryContainer: Color(0xFF3B4D00),
  onPrimaryContainer: Color(0xFFD1EE7C),
  secondary: Color(0xFFC3CAA9),
  onSecondary: Color(0xFF2D331C),
  secondaryContainer: Color(0xFF434931),
  onSecondaryContainer: Color(0xFFDFE6C4),
  tertiary: Color(0xFFF1BF48),
  onTertiary: Color(0xFF3F2E00),
  tertiaryContainer: Color(0xFF5B4300),
  onTertiaryContainer: Color(0xFFFFDF9D),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1B1C17),
  onBackground: Color(0xFFE4E3DB),
  surface: Color(0xFF1B1C17),
  onSurface: Color(0xFFE4E3DB),
  surfaceVariant: Color(0xFF46483C),
  onSurfaceVariant: Color(0xFFC6C8B8),
  outline: Color(0xFF909284),
  onInverseSurface: Color(0xFF1B1C17),
  inverseSurface: Color(0xFFE4E3DB),
  inversePrimary: Color(0xFF506600),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFB5D263),
  outlineVariant: Color(0xFF46483C),
  scrim: Color(0xFF000000),
);
