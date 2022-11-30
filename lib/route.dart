import 'package:flutter/material.dart';

import 'feature/main/pages/main_page.dart';
import 'feature/splash/pages/splash_page.dart';
import 'feature/follow/pages/followed_page.dart';
import 'feature/info/pages/all_industry_page.dart';

class AppRoute {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name;
    switch (routeName) {
      case SplashPage.routeName:
        return _route(const SplashPage(), settings);
      case MainPage.routeName:
        return _route(const MainPage(), settings);
      case AllIndustryPage.routeName:
        return _route(const AllIndustryPage(), settings);
      case FollowedPage.routeName:
        return _route(const FollowedPage(), settings);
      default:
        return null;
    }
  }

  MaterialPageRoute _route(Widget page, RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => page, settings: settings);
  }
}
