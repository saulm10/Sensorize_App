import 'dart:convert';

LoginInputDto loginInputDtoFromJson(String str) =>
    LoginInputDto.fromJson(json.decode(str));

String loginInputDtoToJson(LoginInputDto data) => json.encode(data.toJson());

class LoginInputDto {
  String login;
  String password;

  LoginInputDto({
    required this.login,
    required this.password,
  });

  factory LoginInputDto.fromJson(Map<String, dynamic> json) => LoginInputDto(
        login: json["login"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "password": password,
      };
}
