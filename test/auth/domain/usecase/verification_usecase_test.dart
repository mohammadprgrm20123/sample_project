import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_project/features/authentication/%20verification/data/model/verification_dto.dart';
import 'package:sample_project/features/authentication/%20verification/domain/entity/user_entity.dart';
import 'package:sample_project/features/authentication/%20verification/domain/use_case/verification_use_case.dart';
import 'package:sample_project/features/authentication/%20verification/domain/verification_repository.dart';

import 'verification_usecase_test.mocks.dart';

@GenerateMocks(
  [
    VerificationRepository,
  ],
)
void main() {
  late MockVerificationRepository mockVerificationRepository;
  late VerificationUseCase signUpUseCase;
  late VerficationDto dto;

  setUp(
    () {
      mockVerificationRepository = MockVerificationRepository();
      signUpUseCase = VerificationUseCase(mockVerificationRepository);

      dto = VerficationDto(
          username: 'username', password: 'password', code: 'code');
    },
  );

  test('signup success test', () async {
    when(mockVerificationRepository.verification(dto)).thenAnswer(
        (final _) async =>
            Right(UserEntity(name: '', family: '', id: '', token: '')));

    final result = await signUpUseCase.call(dto);

    expect(result, Right(UserEntity(name: '', family: '', id: '', token: '')));
    verify(mockVerificationRepository.verification(dto));
    verifyNoMoreInteractions(mockVerificationRepository);
  });
}
