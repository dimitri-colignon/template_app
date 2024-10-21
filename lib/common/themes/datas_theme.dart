import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template_app/common/themes/borders_theme.dart';
import 'package:template_app/common/themes/colors_theme.dart';
import 'package:template_app/common/themes/texts_theme.dart';

class DatasTheme {
  DatasTheme._();

  static final ColorScheme _colorScheme = ColorScheme.fromSeed(seedColor: ColorsTheme.kPrimary);
  static ThemeData themeDataLight = ThemeData().copyWith(
    colorScheme: _colorScheme,
    scaffoldBackgroundColor: ColorsTheme.kOnPrimary,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsTheme.kWhite,
      foregroundColor: ColorsTheme.kBlack,
      centerTitle: true,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    //dividerTheme: const DividerThemeData(color: ColorsTheme.kPrimary),
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: ColorsTheme.kBlueLight),
    cardTheme: const CardTheme(
      color: ColorsTheme.kOnPrimary,
      elevation: 1.5,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsTheme.kOnPrimary,
      outlineBorder: const BorderSide(
        color: ColorsTheme.kGreyDark,
        width: 0.2,
      ),
      border: BordersTheme.outlineInputBorder,
      enabledBorder: BordersTheme.outlineInputBorder,
      labelStyle: TextsTheme.styleInputDecorationDefault,
      hintStyle: TextsTheme.styleInputDecorationDefault,
      errorStyle: TextsTheme.styleInputDecorationError,
      contentPadding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: ColorsTheme.kGreyLight,
    ),
  );
}
