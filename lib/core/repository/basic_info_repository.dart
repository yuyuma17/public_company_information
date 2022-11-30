import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../entities/company.dart';
import '../entities/failure.dart';
import '../utils/api_response_wrapper.dart';
import '../remote/data_store/basic_info_remote_data_store.dart';

class BasicInfoRepository {
  final BasicInfoRemoteDataStore _basicInfoRemoteDataStore =
      GetIt.instance.get<BasicInfoRemoteDataStore>();

  Future<Either<Failure, List<Company>?>>
      getAllPublicCompanyInformation() async {
    return await wrapRemoteCall(
      _basicInfoRemoteDataStore.getAllPublicCompanyInformation(),
    );
  }
}
