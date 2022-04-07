class UserEntity {
  final String email;
  final String password;
  final String phone;

  UserEntity({
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, Object?> toJson() {
    var json = <String, Object?>{
      'email': email,
      'password': password,
      'phone': phone,
    };
    return json;
  }

  UserEntity.fromJson(Map<String, Object?> json)
      : email = json['email'] as String,
        password = json['password'] as String,
        phone = json['phone'] as String;
}
