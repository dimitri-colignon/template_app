import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/views/screens/main/pages/account_page.dart';
import 'package:template_app/views/screens/main/pages/home_page.dart';

class HomePageModel {
  final String title;
  final IconData icon;
  final Widget child;

  HomePageModel({
    required this.title,
    required this.icon,
    required this.child,
  });
}

final List<HomePageModel> listHomePageModel = [
  HomePageModel(title: TextsConstant.kTitleScreenHome, icon: FontAwesomeIcons.house, child: const HomePage()),
  HomePageModel(title: TextsConstant.kTitleScreenAccount, icon: FontAwesomeIcons.solidUser, child: const AccountPage()),
];
