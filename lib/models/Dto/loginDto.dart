import 'dart:convert';

LoginDto loginDtoFromJson(String str) => LoginDto.fromJson(json.decode(str));

String loginDtoToJson(LoginDto data) => json.encode(data.toJson());

class LoginDto {
  String message;
  String token;
  bool ok;

  LoginDto({
    required this.message,
    required this.token,
    required this.ok,
  });

  @override
  factory LoginDto.fromJson(Map<String, dynamic> json) => LoginDto(
        message: json["message"],
        token: json["token"],
        ok: json["ok"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "ok": ok,
      };
}
