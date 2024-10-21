import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:template_app/common/extensions/string_extensions.dart';
import 'package:template_app/common/themes/colors_theme.dart';
import 'package:template_app/common/themes/gradients_theme.dart';
import 'package:template_app/models/interfaces/home_page_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: listHomePageModel[_pageIndex].child,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          elevation: 0.0,
          activeIndex: _pageIndex,
          itemCount: listHomePageModel.length,
          tabBuilder: (index, isActive) {
            final HomePageModel homePageModel = listHomePageModel[index];
            return Tooltip(
              message: homePageModel.title.capitalize(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (isActive) ...[
                    Icon(homePageModel.iconActive, color: ColorsTheme.kOnPrimary, size: homePageModel.iconSize),
                    Text(homePageModel.title.capitalize(), style: const TextStyle(color: ColorsTheme.kOnPrimary, fontSize: 10.0)),
                  ] else ...[
                    Icon(homePageModel.iconInactive, color: ColorsTheme.kOnPrimary.withOpacity(0.75), size: homePageModel.iconSize),
                  ],
                ],
              ),
            );
          },
          onTap: (p0) => setState(() => _pageIndex = p0),
          gapLocation: GapLocation.none,
          leftCornerRadius: 32.0,
          rightCornerRadius: 32.0,
          backgroundGradient: GradientsTheme.linearGradientBar,
        ),
      ),
    );
  }
}
