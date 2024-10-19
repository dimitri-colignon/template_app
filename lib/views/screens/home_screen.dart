import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/models/interfaces/home_menu_model.dart';
import 'package:template_app/views/widgets/card/menu_card.dart';
import 'package:template_app/views/widgets/scaffold/app_bar/background_app_bar.dart';
import 'package:template_app/views/widgets/scaffold/app_bar/title_app_bar.dart';
import 'package:template_app/views/widgets/scaffold/bottom_bar/background_line_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            const BackgroundAppBar(height: 50.0),
            const TitleAppBar(),
            Positioned(
              left: 0.0,
              top: 85.0, // 110.0,
              right: 0.0,
              bottom: 0.0,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listHomeMenu.length,
                itemBuilder: (context, index) {
                  return MenuCard(
                    title: listHomeMenu[index].title,
                    onTap: () => context.go(listHomeMenu[index].route),
                  );
                },
              ),
            ),
            const BackgroundLineBottomBar(),
          ],
        ),
      ),
    );
  }
}
