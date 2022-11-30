import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/main_page_cubit.dart';
import '../widgets/app_bottom_navigation_bar.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/main';

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainPageCubit(),
      child: Scaffold(
        body: BlocBuilder<MainPageCubit, int>(
          builder: (context, currentIndex) {
            return context.read<MainPageCubit>().getMainPage();
          },
        ),
        bottomNavigationBar: const AppBottomNavigationBar(),
      ),
    );
  }
}
