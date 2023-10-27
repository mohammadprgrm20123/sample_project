import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../api_service/api_endpoints.dart';
import '../api_service/app_http_client.dart';
import '../api_service/app_interceptor.dart';
import '../api_service/logger_interceptor.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt
    ..init()
    ..registerLazySingleton<LoggerInterceptor>(
      LoggerInterceptor.new,
    )
    ..registerLazySingleton<AppHttpClient>(
          () => AppHttpClient(
        interceptors: [
          getIt<LoggerInterceptor>(),
          getIt<AppInterceptor>(),
        ],
      ),
    );
}
