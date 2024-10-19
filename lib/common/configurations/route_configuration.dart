import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/common/constants/routes_constant.dart';
import 'package:template_app/views/screens/about_screen.dart';
import 'package:template_app/views/screens/account_screen.dart';
import 'package:template_app/views/screens/authentications/authentication_screen.dart';
import 'package:template_app/views/screens/credits_screen.dart';
import 'package:template_app/views/screens/presentation/presentation_screen.dart';
import 'package:template_app/views/screens/tests/form_divers_screen.dart';
import 'package:template_app/views/screens/home_screen.dart';
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
      path: RoutesConstant.kRouteHome,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RoutesConstant.kRouteAbout,
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: RoutesConstant.kRouteCredits,
      builder: (context, state) => const CreditsScreen(),
    ),
    GoRoute(
      path: RoutesConstant.kRouteAccount,
      builder: (context, state) => const AccountScreen(),
    ),
    GoRoute(
      path: RoutesConstant.kRouteFormDivers,
      builder: (context, state) => const FormDiversScreen(),
    ),
  ],
);

GoRouter get router => _router;
