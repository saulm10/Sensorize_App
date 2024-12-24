import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:sensorize/config/constants.dart';
import 'package:sensorize/models/model.dart';
import 'package:sensorize/services/services.dart';
import 'package:http/http.dart' as http;

@Singleton(as: HttpsService)
class HttpsServiceImpl implements HttpsService {
  final SecureStorajeService _secureStorajeService;
  late String baseUrl;

  HttpsServiceImpl(this._secureStorajeService) {
    baseUrl = _secureStorajeService.readApiUrl();
  }

  @override
  Future<ResultDto> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    final uri = _buildUri(endpoint, queryParameters);
    try {
      final mergedHeaders = {
        ...await _buildHeaders(),
        if (headers != null) ...headers
      };
      final response = await http.get(uri, headers: mergedHeaders);
      if (response.statusCode == 200) {
        return resultDtoFromJson(response.body);
      } else {
        throw Exception('Error al obtener datos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error en GET: $e');
    }
  }

  @override
  Future<ResultDto> post(
    String endpoint,
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    final uri = _buildUri(endpoint, queryParameters);
    try {
      final mergedHeaders = {
        ...await _buildHeaders(),
        if (headers != null) ...headers
      };
      final response = await http.post(
        uri,
        headers: mergedHeaders,
        body: jsonEncode(data),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return resultDtoFromJson(response.body);
      } else {
        throw Exception('Error al enviar datos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error en POST: $e');
    }
  }

  @override
  Future<ResultDto> put(
    String endpoint,
    Map<String, dynamic> data, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    final uri = _buildUri(endpoint, queryParameters);
    try {
      final mergedHeaders = {
        ...await _buildHeaders(),
        if (headers != null) ...headers
      };
      final response = await http.put(
        uri,
        headers: mergedHeaders,
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        return resultDtoFromJson(response.body);
      } else {
        throw Exception('Error al actualizar datos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error en PUT: $e');
    }
  }

  /// Método para construir los headers con o sin token
  Future<Map<String, String>> _buildHeaders() async {
    String token = await _secureStorajeService.read(Constants.token);

    final headers = {'Content-Type': 'application/json'};
    if (token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  /// Método para construir la URI con parámetros de consulta
  Uri _buildUri(String endpoint, Map<String, String>? queryParameters) {
    return Uri.parse('$baseUrl/$endpoint')
        .replace(queryParameters: queryParameters);
  }
}
