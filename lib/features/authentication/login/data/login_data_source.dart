import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api_service/api_endpoints.dart';
import '../../../../core/api_service/app_http_client.dart';
import '../../../../core/domain/failure_entity.dart';
import 'models/login_dto.dart';

class LoginDataSource {
  final AppHttpClient appHttpClient;

  LoginDataSource({required this.appHttpClient});

  Future<Either<FailureEntity, void>> login({
    required final LoginDto dto,
  }) async {
    ///this line commented becuse I dont have any backend api
    // final result = appHttpClient.post(ApiEndPoints.login,data: dto.toJson());

    await Future.delayed(const Duration(seconds: 3));

    dynamic res = {
      ''

    };
    return const Right(null);
  }
}
