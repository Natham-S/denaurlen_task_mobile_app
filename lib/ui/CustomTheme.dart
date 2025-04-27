import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomColorScheme.dart';

final theme = ThemeData.from(colorScheme: customColorScheme).copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: customColorScheme.surface,
  colorScheme: customColorScheme,

  textTheme: GoogleFonts.robotoTextTheme().copyWith(
    //Roboto
    titleLarge: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 24.0,
      color: customColorScheme.tertiary
    ),
    bodyMedium: GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
      color: customColorScheme.onSurface,
    ),
    labelMedium: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      color: customColorScheme.onPrimary,
    ),

    //Inter
    titleMedium: GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
    ),

    bodyLarge: GoogleFonts.inter(
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
    ),

    bodySmall: GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),

    labelSmall: GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
    ),

    //lato

    headlineLarge: GoogleFonts.lato(
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
    ),

    headlineMedium: GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
    ),

    headlineSmall: GoogleFonts.lato(
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
    ),




  ),
);
