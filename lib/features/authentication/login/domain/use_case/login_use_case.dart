import 'package:dartz/dartz.dart';

import '../../../../../core/domain/base_use_case.dart';
import '../../../../../core/domain/failure_entity.dart';
import '../../data/models/login_dto.dart';
import '../login_repository.dart';

class LoginUseCase extends BaseUseCase<void, LoginDto> {
  final LoginRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<FailureEntity, void>> call(final LoginDto param) async {
    final result = await _repository.login(param);

    return result;
  }
}
