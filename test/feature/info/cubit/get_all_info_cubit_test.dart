import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:public_company_information/core/entities/failure.dart';
import 'package:public_company_information/core/repository/basic_info_repository.dart';
import 'package:public_company_information/feature/info/cubit/get_all_info_cubit.dart';

import '../../../resource/fake_company.dart';
import 'get_all_info_cubit_test.mocks.dart';

@GenerateMocks([BasicInfoRepository])
void main() {
  group('Get All Info Cubit Test', () {
    late GetAllInfoCubit cubit;
    late MockBasicInfoRepository mockBasicInfoRepository;

    setUp(() {
      mockBasicInfoRepository = MockBasicInfoRepository();
      cubit = GetAllInfoCubit(basicInfoRepository: mockBasicInfoRepository);
    });

    tearDown(() {
      cubit.close();
    });

    blocTest<GetAllInfoCubit, GetAllInfoState>(
      'Test: Emits [Loading, Success] when getting data from API successfully',
      build: () {
        when(
          mockBasicInfoRepository.getAllPublicCompanyInformation(),
        ).thenAnswer((_) => Future.value(const Right(fakeList)));
        return cubit;
      },
      act: (_) => cubit.getAllPublicCompanyInformation(),
      expect: () => [
        isA<Loading>(),
        isA<Success>(),
      ],
    );

    blocTest<GetAllInfoCubit, GetAllInfoState>(
      'Test: Emits [Loading, Success] when getting data from API successfully but empty',
      build: () {
        when(
          mockBasicInfoRepository.getAllPublicCompanyInformation(),
        ).thenAnswer((_) => Future.value(const Right([])));
        return cubit;
      },
      act: (_) => cubit.getAllPublicCompanyInformation(),
      expect: () => [
        isA<Loading>(),
        isA<Success>(),
      ],
    );

    blocTest<GetAllInfoCubit, GetAllInfoState>(
      'Test: Emits [Loading, Failed] when getting data from API failed',
      build: () {
        when(
          mockBasicInfoRepository.getAllPublicCompanyInformation(),
        ).thenAnswer((_) => Future.value(const Left(ServerFailure())));
        return cubit;
      },
      act: (_) => cubit.getAllPublicCompanyInformation(),
      expect: () => [
        isA<Loading>(),
        isA<Failed>(),
      ],
    );
  });
}
