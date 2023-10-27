import 'package:dartz/dartz.dart';

import '../../../../core/domain/failure_entity.dart';
import '../domain/entity/user_entity.dart';
import '../domain/verification_repository.dart';
import 'model/user_model.dart';
import 'model/verification_dto.dart';
import 'verification_data_source.dart';

class VerificationRepositoryImpl extends VerificationRepository {
  final VerificationDataSource _dataSource;

  VerificationRepositoryImpl(this._dataSource);

  @override
  Future<Either<FailureEntity, UserEntity>> verification(
      final VerficationDto dto) async {
    final result = await _dataSource.verificationCode(dto: dto);

    return result.fold(
        Left.new, (final r) => Right(UserModel.fromJson(r.data!)));
  }
}
