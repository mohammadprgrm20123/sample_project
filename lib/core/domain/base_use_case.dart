import 'package:dartz/dartz.dart';

import 'failure_entity.dart';

/// [S] is success
/// [P] is parameters

abstract class BaseUseCase<S, P> {
  Future<Either<FailureEntity, S>> call(final P param);
}

