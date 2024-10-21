import 'package:flutter/material.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/extensions/string_extensions.dart';
import 'package:template_app/views/widgets/scaffold/app_bar/background_app_bar.dart';
import 'package:template_app/views/widgets/scaffold/app_bar/button_popup_menu_app_bar.dart';
import 'package:template_app/views/widgets/scaffold/app_bar/title_app_bar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            const BackgroundAppBar(),
            const TitleAppBar(),
            const ButtonPopupMenuAppBar(),
            Positioned(
              left: 0.0,
              top: 110.0,
              right: 0.0,
              bottom: 0.0,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Center(child: Text(TextsConstant.kTitlePageFavorite.capitalize()))],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
