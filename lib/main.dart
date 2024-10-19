import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:template_app/common/configurations/env_configuration.dart';
import 'package:template_app/common/configurations/route_configuration.dart';
import 'package:template_app/common/constants/abouts_constant.dart';
import 'package:template_app/common/themes/colors_theme.dart';
import 'package:template_app/common/themes/datas_theme.dart';
import 'package:template_app/services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // On récupère le fichier pour par exemple l'accès à une API.
  await dotenv.load(fileName: EnvConfiguration.fileName);

  // On initialise le storage en local.
  // PS : Vous pouvez aussi utiliser le package "shared_preferences"
  // mais dans les tests, il est plus gourmand en ressources (voir la page du package de "get_storage")
  await StorageService.init();

  // Affichage uniquement en portrait.
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then((value) {
    runApp(const MyApp());

    EasyLoading.instance
      ..userInteractions = false
      ..dismissOnTap = false;
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorsTheme.kBlack,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: ColorsTheme.kBlack,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AboutsConstant.kAppName,
      theme: DatasTheme.themeDataLight,
      // Permet d'afficher un toast avec l'écran freezé pendant un traitement.
      builder: EasyLoading.init(),
      routerConfig: router,
    );
  }
}
