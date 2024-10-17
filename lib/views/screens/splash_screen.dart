import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/common/constants/assets_constant.dart';
import 'package:template_app/common/constants/routes_constant.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/themes/colors_theme.dart';
import 'package:template_app/services/storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  int _remainingSeconds = 10;

  @override
  void initState() {
    _countdown();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _countdown() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_remainingSeconds <= 1) {
        setState(() {
          timer.cancel();
          if (StorageService.getBool(key: StorageService.kUserConnected) == null) {
            GoRouter.of(context).go(RoutesConstant.kRouteAuthentication);
          } else {
            GoRouter.of(context).go(RoutesConstant.kRouteHome);
          }
        });
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsTheme.kGreyLight,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                AssetsConstant.kPathSplashScreen,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20.0),
              const SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(),
              ),
              const SizedBox(height: 5.0),
              Text(
                TextsConstant.kWaiting.replaceFirst("%1", _remainingSeconds.toString()),
                style: const TextStyle(color: ColorsTheme.kBlueLight, fontSize: 12.0),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
