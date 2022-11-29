import 'package:flutter/material.dart';

import 'route.dart';
import 'feature/splash/pages/splash_page.dart';

class PublicCompanyInformationApp extends StatelessWidget {
  const PublicCompanyInformationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashPage.routeName,
      onGenerateRoute: AppRoute().onGenerateRoute,
    );
  }
}
