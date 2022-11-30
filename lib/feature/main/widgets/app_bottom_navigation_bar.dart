import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/main_page_cubit.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, int>(
      builder: (context, currentIndex) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_work_outlined),
              label: '產業',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              label: '追蹤',
            ),
          ],
          currentIndex: currentIndex,
          onTap: (index) {
            context.read<MainPageCubit>().updateIndex(index);
          },
        );
      },
    );
  }
}
