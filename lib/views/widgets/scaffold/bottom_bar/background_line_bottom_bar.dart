import 'package:flutter/material.dart';
import 'package:template_app/common/themes/gradients_theme.dart';

class BackgroundLineBottomBar extends StatelessWidget {
  const BackgroundLineBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Container(
        height: 5.0,
        decoration: const BoxDecoration(
          gradient: GradientsTheme.linearGradientBar,
        ),
      ),
    );
  }
}
