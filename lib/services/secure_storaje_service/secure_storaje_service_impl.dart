import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/services/services.dart';

@Singleton(as: SecureStorajeService)
class SecureStorajeServiceImpl implements SecureStorajeService {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  Future<String> read(String name) async {
    return await secureStorage.read(key: name) ?? '';
  }

  @override
  Future<void> write(String name, dynamic value) async {
    return await secureStorage.write(key: name, value: value);
  }

  @override
  Future<void> delete(String name) async {
    return await secureStorage.delete(key: name);
  }

  @override
  String readApiUrl() {
    return dotenv.env['API_URL'] ?? '';
  }
}
