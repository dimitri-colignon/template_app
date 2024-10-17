import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/common/constants/routes_constant.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/enums/messages_enum.dart';
import 'package:template_app/common/extensions/string_extensions.dart';
import 'package:template_app/common/messages/snack_bar_message.dart';
import 'package:template_app/common/themes/buttons_theme.dart';
import 'package:template_app/controllers/authentication_controller.dart';

class ButtonSignOutAppBar extends StatelessWidget {
  const ButtonSignOutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50.0,
      right: 20.0,
      child: FilledButton.icon(
        style: ButtonsTheme.filledButtonSquare,
        icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
        iconAlignment: IconAlignment.end,
        label: Text(TextsConstant.kAuthenticationSignOut.toUpperCase()),
        onPressed: () async {
          try {
            EasyLoading.show(status: "${TextsConstant.kAuthenticationSignOut.capitalize()} ...");
            await AuthenticationController.signOut(context: context);
            if (!context.mounted) return;
            EasyLoading.dismiss();
            GoRouter.of(context).go(RoutesConstant.kRouteAuthentication);
          } catch (e) {
            if (!context.mounted) return;
            EasyLoading.dismiss();
            SnackBarMessage.show(context: context, typeMessage: TypeMessage.typeError, message: e.toString());
          }
        },
      ),
    );
  }
}
