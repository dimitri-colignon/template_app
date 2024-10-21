import 'package:flutter/material.dart';
import 'package:template_app/common/themes/borders_theme.dart';
import 'package:template_app/common/themes/colors_theme.dart';
import 'package:template_app/common/themes/texts_theme.dart';

class ButtonsTheme {
  ButtonsTheme._();

  static final ButtonStyle iconButtonSquare = IconButton.styleFrom(
    backgroundColor: ColorsTheme.kGreyLight.withOpacity(0.75),
    foregroundColor: ColorsTheme.kBlack,
    fixedSize: const Size(40.0, 40.0),
    iconSize: 20.0,
    shape: BordersTheme.roundedRectangleBorder,
  );

  static final ButtonStyle iconButtonCircle = IconButton.styleFrom(
    backgroundColor: ColorsTheme.kPrimary,
    foregroundColor: ColorsTheme.kOnPrimary,
    shape: const CircleBorder(),
    elevation: 1.5,
  );

  static final ButtonStyle filledButtonSquare = FilledButton.styleFrom(
    backgroundColor: ColorsTheme.kGreyLight.withOpacity(0.75),
    foregroundColor: ColorsTheme.kBlack,
    shape: BordersTheme.roundedRectangleBorder,
    textStyle: TextsTheme.styleFilledButton,
  );

  static final ButtonStyle filledButtonDefault = FilledButton.styleFrom(
    backgroundColor: ColorsTheme.kPrimary,
    foregroundColor: ColorsTheme.kOnPrimary,
    textStyle: TextsTheme.styleFilledButton,
    elevation: 1.5,
  );

  static final ButtonStyle textButtonDefault = TextButton.styleFrom(
    alignment: Alignment.center,
    backgroundColor: ColorsTheme.kOnPrimary,
    foregroundColor: ColorsTheme.kPrimary,
    textStyle: TextsTheme.styleTextdButton,
  );
}
