import 'package:sensorize/models/Dto/resultDto.dart';

abstract class HttpsService {
  Future<ResultDto> get(String endpoint,
      {Map<String, String>? headers, Map<String, String>? queryParameters});
  Future<ResultDto> post(String endpoint, Map<String, dynamic> data,
      {Map<String, String>? headers, Map<String, String>? queryParameters});
  Future<ResultDto> put(String endpoint, Map<String, dynamic> data,
      {Map<String, String>? headers, Map<String, String>? queryParameters});
}
