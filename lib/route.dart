import 'package:flutter/material.dart';

import 'feature/splash/pages/splash_page.dart';

class AppRoute {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name;
    switch (routeName) {
      case SplashPage.routeName:
        return _route(const SplashPage(), settings);
      default:
        return null;
    }
  }

  MaterialPageRoute _route(Widget page, RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => page, settings: settings);
  }
}
