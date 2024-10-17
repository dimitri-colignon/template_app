import 'package:flutter/material.dart';
import 'package:template_app/common/constants/abouts_constant.dart';
import 'package:template_app/common/themes/colors_theme.dart';

class TitleAppBar extends StatelessWidget {
  final String? title;

  const TitleAppBar({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 15.0,
      top: 10.0,
      right: 15.0,
      child: Text(
        (title != null) ? title!.toUpperCase() : AboutsConstant.kAppName.toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: ColorsTheme.kOnPrimary,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
