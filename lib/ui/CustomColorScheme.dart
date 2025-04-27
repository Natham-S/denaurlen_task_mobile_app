import 'package:flutter/material.dart';

final customColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,

  seedColor: const Color.fromRGBO(75, 0, 130, 1.0),


  primary: const Color.fromRGBO(75, 0, 130, 1.0),
  onPrimary: Colors.white,
  primaryContainer: const Color.fromARGB(255, 75, 0, 130),

  secondary: const Color.fromARGB(255, 25, 1, 43),
  onSecondary: const Color.fromARGB(255, 150, 140, 157),

  tertiary: const Color.fromARGB(255, 0, 0, 0),
  onTertiary: const Color.fromARGB(255, 204, 204, 204),
  tertiaryFixed:  const Color.fromARGB(255, 52, 52, 52),


  surface: const Color.fromARGB(255, 255, 255, 255),
  onSurface: const Color.fromARGB(255, 70, 53, 97),


  error: const Color(0xFFD32F2F),
  onError: Colors.white,
);
