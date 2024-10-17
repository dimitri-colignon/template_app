import 'package:flutter/material.dart';
import 'package:template_app/common/enums/messages_enum.dart';
import 'package:template_app/common/extensions/string_extensions.dart';
import 'package:template_app/common/themes/colors_theme.dart';

class SnackBarMessage {
  SnackBarMessage._();

  static void show({required BuildContext context, TypeMessage typeMessage = TypeMessage.typeInformation, required String message}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: typeMessage.color,
        content: Text(message.capitalize(), style: const TextStyle(color: ColorsTheme.kOnPrimary, fontWeight: FontWeight.w700)),
        showCloseIcon: true,
        closeIconColor: ColorsTheme.kOnPrimary,
      ),
    );
  }
}
