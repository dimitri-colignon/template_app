import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/common/constants/routes_constant.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/models/interfaces/credits_model.dart';
import 'package:template_app/views/widgets/card/window_card.dart';
import 'package:template_app/views/widgets/card/window_item_link_card.dart';
import 'package:template_app/views/widgets/scaffold/app_bar/background_app_bar.dart';
import 'package:template_app/views/widgets/scaffold/app_bar/button_back_app_bar.dart';
import 'package:template_app/views/widgets/scaffold/app_bar/title_app_bar.dart';
import 'package:template_app/views/widgets/scaffold/bottom_bar/background_line_bottom_bar.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            const BackgroundAppBar(),
            const TitleAppBar(),
            ButtonBackAppBar(onPressed: () => GoRouter.of(context).go(RoutesConstant.kRouteHome)),
            Positioned(
              left: 0.0,
              top: 110.0,
              right: 0.0,
              bottom: 0.0,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: WindowCard(
                      title: TextsConstant.kTitleScreenCredits,
                      children: <Widget>[
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: listCredits.length,
                          itemBuilder: (context, index) => WindowItemLinkCard(name: listCredits[index].name, url: listCredits[index].url),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const BackgroundLineBottomBar(),
          ],
        ),
      ),
    );
  }
}
