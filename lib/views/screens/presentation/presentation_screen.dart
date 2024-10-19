import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:provider/provider.dart';
import 'package:template_app/common/constants/assets_constant.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/themes/buttons_theme.dart';
import 'package:template_app/common/themes/colors_theme.dart';
import 'package:template_app/providers/presentation_provider.dart';
import 'package:template_app/views/screens/presentation/pages/presentation_page.dart';
import 'package:template_app/views/widgets/scaffold/app_bar/background_line_top_bar.dart';
import 'package:template_app/views/widgets/scaffold/bottom_bar/background_line_bottom_bar.dart';

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: context.read<PresentationProvider>().selectedPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsTheme.kWhite,
        body: Stack(
          children: <Widget>[
            const BackgroundLineTopBar(),
            Positioned(
              left: 0.0,
              top: 5.0,
              right: 0.0,
              bottom: 45.0,
              child: Container(
                color: ColorsTheme.kGreyLight,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (page) => context.read<PresentationProvider>().setSelectedPage = page,
                  children: const [
                    PresentationPage(imagePath: AssetsConstant.kPathSmartphone1, title: "title", subTitle: "subTitle", description: TextsConstant.kPresentationDescription1),
                    PresentationPage(imagePath: AssetsConstant.kPathSmartphone2, title: "title", subTitle: "subTitle", description: TextsConstant.kPresentationDescription2),
                    PresentationPage(imagePath: AssetsConstant.kPathSmartphone3, title: "title", subTitle: "subTitle\nGet started", description: TextsConstant.kPresentationDescription3, withBtnNextScreen: true),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 15.0,
              right: 15.0,
              bottom: 20.0,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 50.0,
                    child: context.watch<PresentationProvider>().selectedPage == 0
                        ? const SizedBox.shrink() //const FaIcon(FontAwesomeIcons.circleRight, color: ColorsTheme.kBlueLight, size: 24.0)
                        : IconButton(
                            style: ButtonsTheme.iconButtonCircle,
                            onPressed: () => _pageController.animateToPage(context.read<PresentationProvider>().selectedPage - 1, duration: const Duration(milliseconds: 200), curve: Curves.easeIn),
                            icon: const FaIcon(FontAwesomeIcons.caretLeft, size: 24.0),
                          ),
                  ),
                  Expanded(
                    child: PageViewDotIndicator(
                      currentItem: context.watch<PresentationProvider>().selectedPage,
                      count: 3,
                      unselectedColor: ColorsTheme.kPrimary,
                      selectedColor: ColorsTheme.kBlueDark,
                      boxShape: BoxShape.rectangle,
                      duration: const Duration(milliseconds: 200),
                      onItemClicked: (index) => _pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.easeIn),
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                    child: context.watch<PresentationProvider>().selectedPage == 2
                        ? const SizedBox.shrink() //const FaIcon(FontAwesomeIcons.circleRight, color: ColorsTheme.kBlueLight, size: 24.0)
                        : IconButton(
                            style: ButtonsTheme.iconButtonCircle,
                            onPressed: () => _pageController.animateToPage(context.read<PresentationProvider>().selectedPage + 1, duration: const Duration(milliseconds: 200), curve: Curves.easeIn),
                            icon: const FaIcon(FontAwesomeIcons.caretRight, size: 24.0),
                          ),
                  ),
                ],
              ),
            ),
            const BackgroundLineBottomBar()
          ],
        ),
      ),
    );
  }
}
