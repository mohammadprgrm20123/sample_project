import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_project/features/authentication/login/data/models/login_dto.dart';
import 'package:sample_project/features/authentication/login/domain/login_repository.dart';
import 'package:sample_project/features/authentication/login/domain/use_case/login_use_case.dart';

import 'login_usecase_test.mocks.dart';


@GenerateMocks(
  [
    LoginRepository,
  ],
)
void main() {
  late MockLoginRepository mockLoginRepository;
  late LoginUseCase loginUseCase;
  final dto = LoginDto(email: '', password: '', confirm: '');
  setUp(
        () {
      mockLoginRepository = MockLoginRepository();
      loginUseCase = LoginUseCase(mockLoginRepository);
    },
  );

  test(
    'Success login test',
        () async {
      when(mockLoginRepository.login(dto))
          .thenAnswer((final _) async => const Right(null));

      final result = await loginUseCase.call(dto);

      expect(result, const Right(null));
      verify(mockLoginRepository.login(dto));
      verifyNoMoreInteractions(mockLoginRepository);
    },
  );

}
