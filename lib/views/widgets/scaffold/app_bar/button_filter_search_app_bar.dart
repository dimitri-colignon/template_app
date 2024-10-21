import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/themes/buttons_theme.dart';

class ButtonFilterSearchAppBar extends StatelessWidget {
  const ButtonFilterSearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40.0,
      right: 65.0,
      child: IconButton(
        style: ButtonsTheme.iconButtonSquare,
        icon: const Icon(FontAwesomeIcons.sliders),
        onPressed: () {
          // TODO: Brancher le compteur.
        },
        tooltip: TextsConstant.kTooltipButtonFilterSearch,
      ),
    );
  }
}
