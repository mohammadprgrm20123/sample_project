import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.name,
      required super.family,
      required super.id,
      required super.token});

  factory UserModel.fromJson(final Map<String, dynamic> json) => UserModel(
      name: json['name'],
      family: json['family'],
      id: json['id'],
      token: json['token']);
}
