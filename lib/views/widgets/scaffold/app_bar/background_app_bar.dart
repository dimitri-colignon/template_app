import 'package:flutter/material.dart';
import 'package:template_app/common/themes/gradients_theme.dart';

class BackgroundAppBar extends StatelessWidget {
  final double height;

  const BackgroundAppBar({
    super.key,
    this.height = 75.0,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      top: 0.0,
      right: 0.0,
      child: Container(
        height: height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32.0),
            bottomRight: Radius.circular(32.0),
          ),
          gradient: GradientsTheme.linearGradientBar,
        ),
      ),
    );
  }
}
