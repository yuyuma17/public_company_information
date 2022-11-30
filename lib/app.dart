import 'package:flutter/material.dart';
import 'package:public_company_information/feature/main/pages/main_page.dart';

import 'route.dart';
import 'feature/splash/pages/splash_page.dart';

class PublicCompanyInformationApp extends StatelessWidget {
  const PublicCompanyInformationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainPage.routeName,
      onGenerateRoute: AppRoute().onGenerateRoute,
    );
  }
}
