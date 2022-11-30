import 'package:get_it/get_it.dart';

import 'core/remote/api_client.dart';
import 'core/remote/data_store/basic_info_remote_data_store.dart';
import 'core/repository/basic_info_repository.dart';

DI di = DI();

class DI {
  void setup() {
    final getIt = GetIt.instance;

    /// API
    getIt.registerSingleton<ApiClient>(ApiClient());
    getIt.registerLazySingleton<BasicInfoRemoteDataStore>(
      () => BasicInfoRemoteDataStore(getIt.get<ApiClient>().client),
    );

    /// Repository
    getIt.registerLazySingleton<BasicInfoRepository>(() => BasicInfoRepository());
  }
}
