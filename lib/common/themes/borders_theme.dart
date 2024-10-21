import 'package:flutter/material.dart';
import 'package:template_app/common/themes/colors_theme.dart';

class BordersTheme {
  BordersTheme._();

  static final RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(9.0),
    side: const BorderSide(
      color: ColorsTheme.kGreyDark,
      width: 0.2,
    ),
  );

  static final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(9.0),
    borderSide: const BorderSide(
      color: ColorsTheme.kGreyDark,
      width: 0.2,
    ),
  );
}
