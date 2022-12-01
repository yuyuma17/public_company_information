import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../follow/pages/followed_page.dart';
import '../../info/pages/all_industry_page.dart';

/*
Cubit for MainPage showing and BottomNavigationBar currentIndex.
*/
class MainPageCubit extends Cubit<int> {
  MainPageCubit() : super(0);

  void updateIndex(int index) {
    if (index != state) {
      emit(index);
    }
  }

  Widget getMainPage() {
    switch (state) {
      case 0:
        return const AllIndustryPage();
      case 1:
        return const FollowedPage();
      default:
        throw FormatException('Unknown page index: $state');
    }
  }
}
