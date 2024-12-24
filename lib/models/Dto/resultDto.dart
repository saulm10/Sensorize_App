import 'dart:convert';

ResultDto resultDtoFromJson(String str) => ResultDto.fromJson(json.decode(str));

class ResultDto {
  final bool ok;
  final String? message;
  final String? error;
  final String? token;
  final Map<String, dynamic>? data;

  ResultDto({
    required this.ok,
    required this.token,
    required this.message,
    this.error,
    this.data,
  });

  ResultDto.fromError(
      {this.ok = false, this.message, this.error, this.token, this.data});

  factory ResultDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return ResultDto(
        ok: json['ok'] as bool,
        token: json['token'] ?? "",
        message: json['message'] as String?,
        error: json['error'] as String?,
        data: json['data'] as Map<String, dynamic>?);
  }
}
