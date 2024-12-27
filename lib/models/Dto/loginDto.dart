import 'dart:convert';

LoginDto loginDtoFromJson(String str) => LoginDto.fromJson(json.decode(str));

String loginDtoToJson(LoginDto data) => json.encode(data.toJson());

class LoginDto {
  String token;

  LoginDto({
    required this.token,
  });

  @override
  factory LoginDto.fromJson(Map<String, dynamic> json) => LoginDto(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
