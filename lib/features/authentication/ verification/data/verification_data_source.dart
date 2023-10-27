import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api_service/api_endpoints.dart';
import '../../../../core/api_service/app_http_client.dart';
import '../../../../core/domain/failure_entity.dart';
import 'model/verification_dto.dart';

class VerificationDataSource {
  final AppHttpClient _appHttpClient;

  VerificationDataSource(this._appHttpClient);

  Future<Either<FailureEntity, Response<Map<String, dynamic>>>>
      verificationCode({required final VerficationDto dto}) async {
    // _appHttpClient.post(ApiEndPoints.verification, data: dto.toJson());

    final response = {
      'name': 'mohammad',
      'family': 'kazeminejad',
      'id': '1213232',
      'token': 'asdlkjdwqe89wqe8w79qjwewqewqjewewn9qenblv8ervt9tn'
    };

    await Future.delayed(const Duration(seconds: 4));
    return Right(Response(data: response, requestOptions: RequestOptions()));
  }
}
