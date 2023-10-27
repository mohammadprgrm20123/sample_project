import 'package:injectable/injectable.dart';

import '../core/api_service/app_http_client.dart';
import '../core/di/injection.dart';
import '../features/authentication/ verification/data/verification_data_source.dart';
import '../features/authentication/ verification/data/verification_repository_impl.dart';
import '../features/authentication/ verification/domain/use_case/verification_use_case.dart';
import '../features/authentication/ verification/domain/verification_repository.dart';
import '../features/authentication/login/data/login_data_source.dart';
import '../features/authentication/login/data/login_repository_impl.dart';
import '../features/authentication/login/domain/login_repository.dart';
import '../features/authentication/login/domain/use_case/login_use_case.dart';

@module
abstract class FeatureModule {
  LoginDataSource get loginDataSource => LoginDataSource(
        appHttpClient: getIt<AppHttpClient>(),
      );

  LoginRepository get loginRepository => LoginRepositoryImpl(
        loginDataSource,
      );

  LoginUseCase get loginUseCase => LoginUseCase(loginRepository);

  VerificationDataSource get verificationDataSource => VerificationDataSource(
        getIt<AppHttpClient>(),
      );

  VerificationRepository get verificationRepository =>
      VerificationRepositoryImpl(
        verificationDataSource,
      );

  VerificationUseCase get verificationUseCase =>
      VerificationUseCase(verificationRepository);
}
