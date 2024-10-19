import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template_app/common/constants/routes_constant.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/themes/buttons_theme.dart';
import 'package:template_app/common/themes/colors_theme.dart';

class PresentationPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final bool withBtnNextScreen;

  const PresentationPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.withBtnNextScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0.0,
          top: 20.0,
          right: 0.0,
          //bottom: 200.0,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Container(
            height: 300.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 5.0),
            decoration: const BoxDecoration(
              color: ColorsTheme.kWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45.0),
                topRight: Radius.circular(45.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: title[0].toUpperCase(), style: GoogleFonts.nunitoSans(color: ColorsTheme.kSecondary, fontSize: 30.0, fontWeight: FontWeight.bold)),
                      TextSpan(text: title.substring(1), style: const TextStyle(color: ColorsTheme.kBlack, fontSize: 20.0, fontWeight: FontWeight.normal, letterSpacing: 0.2)),
                    ],
                  ),
                ),
                const SizedBox(height: 25.0),
                Text(description, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black45, fontSize: 12.0, fontWeight: FontWeight.w200)),
                const SizedBox(height: 20.0),
                if (withBtnNextScreen)
                  FilledButton(
                    style: ButtonsTheme.filledButtonDefault,
                    onPressed: () => context.go(RoutesConstant.kRouteAuthentication),
                    child: const Text(TextsConstant.kBtnGetStarted),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
