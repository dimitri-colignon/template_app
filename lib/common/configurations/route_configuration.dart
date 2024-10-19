import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/common/constants/routes_constant.dart';
import 'package:template_app/views/screens/main/main_screen.dart';
import 'package:template_app/views/screens/authentications/authentication_screen.dart';
import 'package:template_app/views/screens/informations/informations_screen.dart';
import 'package:template_app/views/screens/presentation/presentation_screen.dart';
import 'package:template_app/views/screens/splash/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: RoutesConstant.kRouteInitialLocation,
  routes: [
    GoRoute(
      path: RoutesConstant.kRouteSplash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutesConstant.kRoutePresentation,
      builder: (context, state) => const PresentationScreen(),
    ),
    GoRoute(
      path: RoutesConstant.kRouteAuthentication,
      builder: (context, state) => const AuthenticationScreen(),
    ),
    GoRoute(
      path: RoutesConstant.kRouteMain,
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: RoutesConstant.kRouteInformation,
      builder: (context, state) => const InformationsScreen(),
    ),
  ],
);

GoRouter get router => _router;
