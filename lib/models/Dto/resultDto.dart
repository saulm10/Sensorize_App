import 'dart:convert';

ResultDto resultDtoFromJson(String str) => ResultDto.fromJson(json.decode(str));

class ResultDto {
  final bool ok;
  final String? message;
  final String? data;

  ResultDto({
    required this.ok,
    required this.message,
    this.data,
  });

  ResultDto.fromError({this.ok = false, this.message, this.data});

  factory ResultDto.fromJson(
    Map<String, dynamic> jsonData,
  ) {
    return ResultDto(
      ok: jsonData['ok'] as bool,
      message: jsonData['msg'] as String?,
      data: json.encode((jsonData['data'])),
    );
  }
}
