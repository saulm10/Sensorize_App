import 'dart:convert';

LoginInputDto loginInputDtoFromJson(String str) =>
    LoginInputDto.fromJson(json.decode(str));

String loginInputDtoToJson(LoginInputDto data) => json.encode(data.toJson());

class LoginInputDto {
  String login;
  String password;
  String tokenApp;

  LoginInputDto({
    required this.login,
    required this.password,
    required this.tokenApp,
  });

  factory LoginInputDto.fromJson(Map<String, dynamic> json) => LoginInputDto(
        login: json["login"],
        password: json["password"],
        tokenApp: json["tokenApp"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "password": password,
        "tokenApp": tokenApp,
      };
}
