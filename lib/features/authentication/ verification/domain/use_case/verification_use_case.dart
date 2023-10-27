import 'package:dartz/dartz.dart';

import '../../../../../core/domain/base_use_case.dart';
import '../../../../../core/domain/failure_entity.dart';
import '../../data/model/verification_dto.dart';
import '../entity/user_entity.dart';
import '../verification_repository.dart';

class VerificationUseCase extends BaseUseCase<UserEntity, VerficationDto> {
  final VerificationRepository _repository;

  VerificationUseCase(this._repository);

  @override
  Future<Either<FailureEntity, UserEntity>> call(
      final VerficationDto param) async {
    final result = await _repository.verification(param);

    return result;
  }
}
