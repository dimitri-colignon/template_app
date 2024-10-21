import 'package:flutter/material.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/themes/buttons_theme.dart';

class ButtonNotificationAppBar extends StatelessWidget {
  const ButtonNotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40.0,
      right: 65.0,
      child: IconButton(
        style: ButtonsTheme.iconButtonSquare,
        icon: Badge.count(
          count: 1,
          child: const Icon(Icons.notifications),
        ),
        onPressed: () {
          // TODO: Brancher le compteur.
        },
        tooltip: TextsConstant.kTooltipButtonNotification,
      ),
    );
  }
}
