// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sample_project/core/api_service/app_interceptor.dart' as _i3;
import 'package:sample_project/features/authentication/%20verification/data/verification_data_source.dart'
    as _i8;
import 'package:sample_project/features/authentication/%20verification/domain/use_case/verification_use_case.dart'
    as _i10;
import 'package:sample_project/features/authentication/%20verification/domain/verification_repository.dart'
    as _i9;
import 'package:sample_project/features/authentication/%20verification/presentation/controller/verification_controller.dart'
    as _i12;
import 'package:sample_project/features/authentication/login/data/login_data_source.dart'
    as _i5;
import 'package:sample_project/features/authentication/login/domain/login_repository.dart'
    as _i6;
import 'package:sample_project/features/authentication/login/domain/use_case/login_use_case.dart'
    as _i7;
import 'package:sample_project/features/authentication/login/presentation/controller/login_controller.dart'
    as _i11;
import 'package:sample_project/features/home/presentation/controller/home_controller.dart'
    as _i4;
import 'package:sample_project/infrastracture/feature_module.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final featureModule = _$FeatureModule();
    gh.factory<_i3.AppInterceptor>(() => _i3.AppInterceptor());
    gh.factory<_i4.HomeController>(() => _i4.HomeController());
    gh.factory<_i5.LoginDataSource>(() => featureModule.loginDataSource);
    gh.factory<_i6.LoginRepository>(() => featureModule.loginRepository);
    gh.factory<_i7.LoginUseCase>(() => featureModule.loginUseCase);
    gh.factory<_i8.VerificationDataSource>(
        () => featureModule.verificationDataSource);
    gh.factory<_i9.VerificationRepository>(
        () => featureModule.verificationRepository);
    gh.factory<_i10.VerificationUseCase>(
        () => featureModule.verificationUseCase);
    gh.factory<_i11.LoginController>(
        () => _i11.LoginController(gh<_i7.LoginUseCase>()));
    gh.factory<_i12.VerificationController>(
        () => _i12.VerificationController(gh<_i10.VerificationUseCase>()));
    return this;
  }
}

class _$FeatureModule extends _i13.FeatureModule {}
