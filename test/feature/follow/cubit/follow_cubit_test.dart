import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:public_company_information/feature/follow/cubit/follow_cubit.dart';

import '../../../resource/fake_company.dart';

main() {
  group('Follow Cubit Test', () {
    late FollowCubit cubit;

    setUp(() {
      cubit = FollowCubit();
    });

    blocTest(
      'Test: emits [] when nothing is added',
      build: () => cubit,
      expect: () => [],
    );

    blocTest(
      'Test: follow a company, will be added into the state',
      build: () => cubit,
      act: (cubit) async {
        cubit.follow(fakeCompany);
      },
      expect: () => [fakeList],
    );

    blocTest(
      'Test: unFollow a company, will be removed from the state',
      setUp: () {
        cubit.emit(fakeList);
      },
      build: () => cubit,
      act: (cubit) async {
        cubit.unFollow(fakeCompany);
      },
      expect: () => [[]],
    );
  });
}
