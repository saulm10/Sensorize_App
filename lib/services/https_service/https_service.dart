abstract class HttpsService {
  Future<dynamic> get(String endpoint,
      {Map<String, String>? headers,
      Map<String, String>? queryParameters,
      dynamic Function(String)? customDeserializer});
  Future<dynamic> post(String endpoint, Map<String, dynamic> data,
      {Map<String, String>? headers,
      Map<String, String>? queryParameters,
      dynamic Function(String)? customDeserializer});
  Future<dynamic> patch(String endpoint, Map<String, dynamic> data,
      {Map<String, String>? headers,
      Map<String, String>? queryParameters,
      dynamic Function(String)? customDeserializer});
  Future<dynamic> put(String endpoint, Map<String, dynamic> data,
      {Map<String, String>? headers,
      Map<String, String>? queryParameters,
      dynamic Function(String)? customDeserializer});
}
