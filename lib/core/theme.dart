import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = FlexThemeData.light(
  scheme: FlexScheme.bigStone,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 9,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: true,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  useMaterial3: true,
  textTheme: GoogleFonts.interTextTheme(), 
  fontFamily: GoogleFonts.inter().fontFamily, 
);

final ThemeData darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.bigStone,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 13,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    blendOnColors: true,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  useMaterial3: true,
  textTheme: GoogleFonts.interTextTheme(), 
  fontFamily: GoogleFonts.inter().fontFamily, 
);
