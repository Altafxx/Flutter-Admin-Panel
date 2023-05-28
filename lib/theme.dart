import './color_scheme.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightThemeDataCustom = _buildLightTheme();

// TextTheme TextTheme(
//       displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
//       titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
//       bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
//     ),

IconThemeData sidebarIcon = IconThemeData(size: 20, color: Colors.white);

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      colorScheme: lightColorScheme,
      primaryColor: lightColorScheme.primary,
      scaffoldBackgroundColor: lightColorScheme.background,
      textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
      iconTheme: sidebarIcon);
}

final ThemeData darkThemeDataCustom = _buildDarkTheme();

ThemeData _buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      colorScheme: darkColorScheme,
      primaryColor: darkColorScheme.primary,
      scaffoldBackgroundColor: darkColorScheme.background,
      textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      iconTheme: sidebarIcon);
}
