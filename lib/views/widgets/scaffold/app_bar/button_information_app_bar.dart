import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/common/constants/routes_constant.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/themes/buttons_theme.dart';

class ButtonInformationAppBar extends StatelessWidget {
  const ButtonInformationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40.0,
      right: 65.0,
      child: IconButton(
        style: ButtonsTheme.iconButtonSquare,
        icon: const FaIcon(FontAwesomeIcons.info),
        onPressed: () => context.go(RoutesConstant.kRouteInformation),
        tooltip: TextsConstant.kTooltipButtonInformations,
      ),
    );
  }
}
