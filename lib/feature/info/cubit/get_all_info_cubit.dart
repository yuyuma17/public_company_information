import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

import '../../../core/entities/company.dart';
import '../../../core/entities/enum/Industry.dart';
import '../../../core/entities/failure.dart';
import '../../../core/extension/iterable_extension.dart';
import '../../../core/repository/basic_info_repository.dart';

part 'get_all_info_cubit.freezed.dart';

/*
Cubit for get all public company info.
*/
class GetAllInfoCubit extends Cubit<GetAllInfoState> {
  late final BasicInfoRepository _basicInfoRepository;

  GetAllInfoCubit({
    BasicInfoRepository? basicInfoRepository,
  }) : super(const Initial()) {
    _basicInfoRepository =
        basicInfoRepository ?? GetIt.instance.get<BasicInfoRepository>();
  }

  Map<Industry, List<Company>> _groupByIndustry(List<Company> companies) {
    return companies.groupBy((company) => company.industry);
  }

  void getAllPublicCompanyInformation() async {
    emit(const Loading());
    final response =
        await _basicInfoRepository.getAllPublicCompanyInformation();
    response.fold(
      (failure) => emit(Failed(failure)),
      (companies) {
        if (companies != null) {
          final industryGroupMap = _groupByIndustry(companies);
          emit(Success(industryGroupMap));
        } else {
          emit(const Failed(UnknownError()));
        }
      },
    );
  }
}

@freezed
class GetAllInfoState with _$GetAllInfoState {
  const factory GetAllInfoState.initial() = Initial;
  const factory GetAllInfoState.loading() = Loading;
  const factory GetAllInfoState.success(
    Map<Industry, List<Company>> industryGroupMap,
  ) = Success;
  const factory GetAllInfoState.failed(Failure failure) = Failed;
}
