import 'package:dartz/dartz.dart';

import '../../../../core/domain/failure_entity.dart';
import '../data/models/login_dto.dart';

abstract class LoginRepository {
  Future<Either<FailureEntity, void>> login(final LoginDto dto);
}
