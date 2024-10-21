import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/common/constants/routes_constant.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/enums/menu_popup_enum.dart';
import 'package:template_app/common/enums/messages_enum.dart';
import 'package:template_app/common/extensions/string_extensions.dart';
import 'package:template_app/common/messages/dialog_message.dart';
import 'package:template_app/common/messages/snack_bar_message.dart';
import 'package:template_app/common/themes/buttons_theme.dart';
import 'package:template_app/controllers/authentication_controller.dart';

class ButtonPopupMenuAppBar extends StatelessWidget {
  const ButtonPopupMenuAppBar({super.key});

  // Pour le test.
  static const int _count = 3;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40.0,
      right: 20.0,
      child: PopupMenuButton<TypeMenuPopup>(
        style: ButtonsTheme.iconButtonSquare,
        icon: (_count <= 0)
            ? const Icon(Icons.more_vert)
            : Badge.count(
                count: _count,
                child: const Icon(Icons.more_vert),
              ),
        onSelected: (TypeMenuPopup item) {},
        itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<TypeMenuPopup>>[
            PopupMenuItem<TypeMenuPopup>(
              value: TypeMenuPopup.typeNotifier,
              child: ListTile(
                onTap: () {},
                leading: (_count <= 0)
                    ? const Icon(Icons.notifications, size: 20.0)
                    : Badge.count(
                        count: _count,
                        child: const Icon(Icons.notifications, size: 20.0),
                      ),
                title: const Text(TextsConstant.kPopupBtnNotification),
              ),
            ),
            const PopupMenuDivider(height: 0.2),
            PopupMenuItem<TypeMenuPopup>(
              value: TypeMenuPopup.typeInformation,
              child: ListTile(
                onTap: () => context.push(RoutesConstant.kRouteInformation),
                leading: const Icon(FontAwesomeIcons.info, size: 20.0),
                title: const Text(TextsConstant.kPopupBtnInformation),
              ),
            ),
            PopupMenuItem<TypeMenuPopup>(
              value: TypeMenuPopup.typeSignOut,
              child: ListTile(
                onTap: () async {
                  try {
                    if (await DialogMessage.showQuestion(context: context, child: Text(TextsConstant.kDialogMessageQuestion.replaceFirst("%1", TextsConstant.kAuthenticationSignOut)))) {
                      if (!context.mounted) return;
                      EasyLoading.show(status: "${TextsConstant.kAuthenticationSignOut.capitalize()} ...");
                      await AuthenticationController.signOut(context: context);
                      if (!context.mounted) return;
                      EasyLoading.dismiss();
                      GoRouter.of(context).go(RoutesConstant.kRouteAuthentication);
                    }
                  } catch (e) {
                    if (!context.mounted) return;
                    EasyLoading.dismiss();
                    SnackBarMessage.show(context: context, typeMessage: TypeMessage.typeError, message: e.toString());
                  }
                },
                leading: const Icon(FontAwesomeIcons.rightFromBracket, size: 20.0),
                title: const Text(TextsConstant.kPopupBtnDisconnection),
              ),
            ),
          ];
        },
      ),
    );
  }
}
