import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template_app/common/themes/colors_theme.dart';

class TextsTheme {
  TextsTheme._();

  static final TextStyle styleInputDecorationDefault = GoogleFonts.nunitoSans(
    fontSize: 13.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.0,
  );

  static final TextStyle styleInputDecorationError = GoogleFonts.nunitoSans(
    color: ColorsTheme.kRed,
    fontSize: 13.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.0,
  );

  static final TextStyle styleFilledButton = GoogleFonts.nunitoSans(
    fontWeight: FontWeight.w700,
    letterSpacing: 1.5,
  );

  static const TextStyle styleTextdButton = TextStyle(
    fontSize: 13.0,
    letterSpacing: 2.0,
  );
}
