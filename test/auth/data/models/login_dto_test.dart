import 'package:flutter_test/flutter_test.dart';
import 'package:sample_project/features/authentication/login/data/models/login_dto.dart';

void main() {
  test(
    'Login dto toJson test',
    () {
      final LoginDto dto = LoginDto(email: '', password: '', confirm: '');
      final dtoJson = {
        'password': '',
        'email': '',
      };
      expect(
        dtoJson,
        equals(
          dto.toJson(),
        ),
      );
    },
  );
}
