import 'package:dartz/dartz.dart';

import '../../../../core/domain/failure_entity.dart';
import '../domain/login_repository.dart';
import 'login_data_source.dart';
import 'models/login_dto.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginDataSource _dataSource;

  LoginRepositoryImpl(this._dataSource);

  @override
  Future<Either<FailureEntity, void>> login(final LoginDto dto) async {
    final result = await _dataSource.login(dto: dto);

    return result;
  }
}
