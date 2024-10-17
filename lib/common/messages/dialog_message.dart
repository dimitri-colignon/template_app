import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/enums/messages_enum.dart';
import 'package:template_app/common/themes/buttons_theme.dart';

class DialogMessage {
  DialogMessage._();

  // Validation boîte de message pour android ou iOs selon la platforme ou on se trouve.
  static Future<bool> showQuestion({required BuildContext context, required Widget child}) async {
    final TargetPlatform platform = Theme.of(context).platform;
    if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
      return await _showQuestionIos(context: context, child: child);
    } else {
      return await _showQuestionAndroid(context: context, child: child);
    }
  }

  // Simple boîte de message pour android ou iOs selon la platforme ou on se trouve.
  static Future<void> showInformation({required BuildContext context, required TypeMessage typeMessage, required Widget child}) async {
    final TargetPlatform platform = Theme.of(context).platform;
    if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
      await _showInformationIos(context: context, typeMessage: typeMessage, child: child);
    } else {
      await _showInformationAndroid(context: context, typeMessage: typeMessage, child: child);
    }
  }

  // Validation boîte de message pour android.
  static Future<bool> _showQuestionAndroid({required BuildContext context, required Widget child}) async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
              title: const Text(TextsConstant.kTitleQuestion),
              content: child,
              actions: [
                FilledButton(
                  style: ButtonsTheme.filledButtonDefault,
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text(TextsConstant.kBtnOk),
                ),
                FilledButton(
                  style: ButtonsTheme.filledButtonDefault,
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text(TextsConstant.kBtnCancel),
                ),
              ],
            )).then((exit) {
      if (exit == null) return false;
      return exit;
    });
  }

  // Simple boîte de message pour android.
  static Future<void> _showInformationAndroid({required BuildContext context, required TypeMessage typeMessage, required Widget child}) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => SimpleDialog(
        title: Text(typeMessage.title),
        contentPadding: const EdgeInsets.all(20.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: child,
          ),
          const SizedBox(height: 10.0),
          Center(
            child: FilledButton(
              style: ButtonsTheme.filledButtonDefault,
              onPressed: () => Navigator.pop(context),
              child: const Text(TextsConstant.kBtnOk),
            ),
          ),
        ],
      ),
    );
  }

  // Validation boîte de message pour iOs.
  static Future<bool> _showQuestionIos({required BuildContext context, required Widget child}) async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: const Text(TextsConstant.kTitleQuestion),
              content: child,
              actions: [
                CupertinoDialogAction(
                  child: const Text(TextsConstant.kBtnOk),
                  onPressed: () => Navigator.pop(context, true),
                ),
                CupertinoDialogAction(
                  child: const Text(TextsConstant.kBtnCancel),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ],
            )).then((exit) {
      if (exit == null) return false;
      return exit;
    });
  }

  // Simple boîte de message pour iOs.
  static Future<void> _showInformationIos({required BuildContext context, required TypeMessage typeMessage, required Widget child}) async {
    await showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(typeMessage.title),
        content: child,
        actions: [
          CupertinoDialogAction(
            child: const Text(TextsConstant.kBtnOk),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
