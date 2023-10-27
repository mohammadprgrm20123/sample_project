class LoginDto {
  final String email;
  final String password;
  final String confirm;

  LoginDto( {
    required this.email,
    required this.password,
    required this.confirm,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['confirm'] = confirm;
    return data;
  }
}
