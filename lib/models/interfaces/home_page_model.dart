import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/views/screens/main/pages/account_page.dart';
import 'package:template_app/views/screens/main/pages/favorite_page.dart';
import 'package:template_app/views/screens/main/pages/home_page.dart';
import 'package:template_app/views/screens/main/pages/shopping_page.dart';

class HomePageModel {
  final String title;
  final IconData iconActive;
  final IconData iconInactive;
  final double iconSize;
  final Widget child;

  HomePageModel({
    required this.title,
    required this.iconActive,
    required this.iconInactive,
    required this.iconSize,
    required this.child,
  });
}

final List<HomePageModel> listHomePageModel = [
  HomePageModel(title: TextsConstant.kTitlePageHome, iconActive: Icons.home, iconInactive: Icons.home_outlined, iconSize: 22.0, child: const HomePage()),
  HomePageModel(title: TextsConstant.kTitlePageFavorite, iconActive: FontAwesomeIcons.solidHeart, iconInactive: FontAwesomeIcons.heart, iconSize: 16.0, child: const FavoritePage()),
  HomePageModel(title: TextsConstant.kTitlePageShopping, iconActive: Icons.shopping_bag, iconInactive: Icons.shopping_bag_outlined, iconSize: 22.0, child: const ShoppingPage()),
  HomePageModel(title: TextsConstant.kTitlePageAccount, iconActive: FontAwesomeIcons.solidUser, iconInactive: FontAwesomeIcons.user, iconSize: 16.0, child: const AccountPage()),
];
