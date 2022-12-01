import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'route.dart';
import 'feature/splash/pages/splash_page.dart';
import 'feature/follow/cubit/follow_cubit.dart';
import 'feature/info/cubit/get_all_info_cubit.dart';

class PublicCompanyInformationApp extends StatelessWidget {
  const PublicCompanyInformationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetAllInfoCubit()),
        BlocProvider(create: (_) => FollowCubit()),
      ],
      child: MaterialApp(
        initialRoute: SplashPage.routeName,
        onGenerateRoute: AppRoute().onGenerateRoute,
      ),
    );
  }
}
