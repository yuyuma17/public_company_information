import 'package:get_it/get_it.dart';

import 'core/remote/api_client.dart';

DI di = DI();

class DI {
  void setup() {
    final getIt = GetIt.instance;

    /// API
    getIt.registerSingleton<ApiClient>(ApiClient());

    /// Repository
  }
}
