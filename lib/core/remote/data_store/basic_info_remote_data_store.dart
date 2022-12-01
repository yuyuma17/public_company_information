import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../entities/company.dart';

part 'basic_info_remote_data_store.g.dart';

@RestApi()
abstract class BasicInfoRemoteDataStore {
  factory BasicInfoRemoteDataStore(Dio dio) {
    return _BasicInfoRemoteDataStore(dio);
  }

  // 公開發行公司基本資料
  @GET('opendata/t187ap03_P')
  Future<List<Company>> getAllPublicCompanyInformation();
}
