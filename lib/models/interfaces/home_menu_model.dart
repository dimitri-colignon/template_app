import 'package:template_app/common/constants/routes_constant.dart';
import 'package:template_app/common/constants/texts_constant.dart';

class HomeMenuModel {
  final String title;
  final String route;

  HomeMenuModel({
    required this.title,
    required this.route,
  });
}

final List<HomeMenuModel> listHomeMenu = [
  HomeMenuModel(title: TextsConstant.kTitleScreenAbout, route: RoutesConstant.kRouteAbout),
  HomeMenuModel(title: TextsConstant.kTitleScreenCredits, route: RoutesConstant.kRouteCredits),
  HomeMenuModel(title: TextsConstant.kTitleScreenAccount, route: RoutesConstant.kRouteAccount),
  HomeMenuModel(title: TextsConstant.kTitleScreenFormDivers, route: RoutesConstant.kRouteFormDivers),
  // ...
];
