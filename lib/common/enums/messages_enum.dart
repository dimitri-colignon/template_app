import 'package:flutter/material.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/themes/colors_theme.dart';

// Type de messages pour les "SnackBar" ou "Dialog".
enum TypeMessage {
  typeInformation(title: TextsConstant.kTitleInformation, color: ColorsTheme.kGreen),
  typeError(title: TextsConstant.kTitleError, color: ColorsTheme.kRed);

  final String title;
  final Color color;

  const TypeMessage({
    required this.title,
    required this.color,
  });
}
