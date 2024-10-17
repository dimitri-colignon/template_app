import 'package:flutter/material.dart';
import 'package:template_app/common/enums/messages_enum.dart';
import 'package:template_app/common/messages/snack_bar_message.dart';
import 'package:url_launcher/url_launcher.dart';

class LauncherService {
  LauncherService._();

  static Future<void> launchUri({required BuildContext context, required Uri url}) async {
    try {
      if (!await launchUrl(url)) throw "Could not launch $url";
    } catch (e) {
      if (!context.mounted) return;
      SnackBarMessage.show(context: context, typeMessage: TypeMessage.typeError, message: e.toString());
    }
  }
}
