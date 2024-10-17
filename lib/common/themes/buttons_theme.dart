import 'package:flutter/material.dart';
import 'package:template_app/common/themes/colors_theme.dart';
import 'package:template_app/common/themes/texts_theme.dart';

class ButtonsTheme {
  ButtonsTheme._();

  static final ButtonStyle iconButtonSquare = IconButton.styleFrom(
    backgroundColor: ColorsTheme.kGreyLight.withOpacity(0.75),
    foregroundColor: ColorsTheme.kBlack,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(9.0),
      side: const BorderSide(
        color: ColorsTheme.kGreyDark,
        width: 1.0,
      ),
    ),
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
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(9.0),
      side: const BorderSide(
        color: ColorsTheme.kGreyDark,
        width: 1.0,
      ),
    ),
    textStyle: TextsTheme.styleFilledButton,
  );

  static final ButtonStyle filledButtonDefault = FilledButton.styleFrom(
    backgroundColor: ColorsTheme.kPrimary,
    foregroundColor: ColorsTheme.kOnPrimary,
    textStyle: TextsTheme.styleFilledButton,
    elevation: 1.5,
  );
}
