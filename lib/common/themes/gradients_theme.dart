import 'package:flutter/material.dart';
import 'package:template_app/common/themes/colors_theme.dart';

class GradientsTheme {
  GradientsTheme._();

  static const LinearGradient linearGradientContainer = LinearGradient(
    colors: [
      ColorsTheme.kSecondary,
      ColorsTheme.kPrimary,
      ColorsTheme.kBlueLight,
      ColorsTheme.kBlueDark,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topLeft,
  );

  static const LinearGradient linearGradientBar = LinearGradient(
    colors: [
      ColorsTheme.kPrimary,
      ColorsTheme.kBlueLight,
      ColorsTheme.kBlueDark,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topLeft,
  );
}
