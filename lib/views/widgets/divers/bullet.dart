import 'package:flutter/material.dart';
import 'package:template_app/common/themes/colors_theme.dart';

class Bullet extends StatelessWidget {
  const Bullet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5.0,
      height: 5.0,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: ColorsTheme.kPrimary,
        borderRadius: BorderRadius.circular(90.0),
      ),
    );
  }
}
