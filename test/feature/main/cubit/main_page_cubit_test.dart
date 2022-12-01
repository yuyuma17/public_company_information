import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:public_company_information/feature/main/cubit/main_page_cubit.dart';

main() {
  group('Main Page Cubit Test', () {
    late MainPageCubit cubit;

    setUp(() {
      cubit = MainPageCubit();
    });

    blocTest(
      'Test: emits [] when nothing is added',
      build: () => cubit,
      expect: () => [],
    );

    blocTest(
      'Test: emits the same index should not change state',
      build: () => cubit,
      act: (cubit) async {
        cubit.updateIndex(0);
      },
      expect: () => [],
    );

    blocTest(
      'Test: emits the new index should change state',
      build: () => cubit,
      act: (cubit) async {
        cubit.updateIndex(1);
      },
      expect: () => [1],
    );
  });
}
