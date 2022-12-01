import 'package:bloc/bloc.dart';

import '../../../core/entities/company.dart';

/*
Cubit for follow and unFollow the company.
*/
class FollowCubit extends Cubit<List<Company>> {
  FollowCubit() : super([]);

  void follow(Company target) {
    final List<Company> newList = List.from(state);
    newList.add(target);
    emit(newList);
  }

  void unFollow(Company target) {
    final List<Company> newList = List.from(state);
    newList.removeWhere((company) => target.code == company.code);
    emit(newList);
  }
}
