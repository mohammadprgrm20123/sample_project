class VerficationDto {
  final String username;
  final String password;
  final String code;

  VerficationDto( {
    required this.username,
    required this.password,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['confirm'] = password;
    data['code'] = code;
    return data;
  }
}
