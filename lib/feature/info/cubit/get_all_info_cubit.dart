import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

import '../../../core/entities/failure.dart';
import '../../../core/repository/basic_info_repository.dart';

part 'get_all_info_cubit.freezed.dart';

class GetAllInfoCubit extends Cubit<GetAllInfoState> {
  late final BasicInfoRepository _basicInfoRepository;

  GetAllInfoCubit({
    BasicInfoRepository? basicInfoRepository,
  }) : super(const _Initial()) {
    _basicInfoRepository =
        basicInfoRepository ?? GetIt.instance.get<BasicInfoRepository>();
  }

  void getAllPublicCompanyInformation() async {
    emit(const _Loading());
    final response =
        await _basicInfoRepository.getAllPublicCompanyInformation();
    response.fold(
      (failure) => emit(_Fail(failure)),
      (companies) {
        if (companies != null) {
          emit(const _Success());
        } else {
          emit(const _Fail(UnknownError()));
        }
      },
    );
  }
}

@freezed
class GetAllInfoState with _$GetAllInfoState {
  const factory GetAllInfoState.initial() = _Initial;
  const factory GetAllInfoState.loading() = _Loading;
  const factory GetAllInfoState.success() = _Success;
  const factory GetAllInfoState.fail(Failure failure) = _Fail;
}
