import 'package:flutter/material.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/themes/buttons_theme.dart';

class ButtonBackAppBar extends StatelessWidget {
  final void Function() onPressed;

  const ButtonBackAppBar({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20.0,
      top: 40.0,
      child: IconButton(
        style: ButtonsTheme.iconButtonSquare,
        icon: const Icon(Icons.arrow_back),
        onPressed: () => onPressed(),
        tooltip: TextsConstant.kTooltipButtonBack,
      ),
    );
  }
}
