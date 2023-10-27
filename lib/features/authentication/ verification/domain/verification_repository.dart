import 'package:dartz/dartz.dart';

import '../../../../core/domain/failure_entity.dart';
import '../data/model/verification_dto.dart';
import 'entity/user_entity.dart';

abstract class VerificationRepository {
  Future<Either<FailureEntity, UserEntity>> verification(
      final VerficationDto dto);
}
