abstract class SecureStorajeService {
  Future<String> read(String name);
  Future<void> write(String name, dynamic value);
  Future<void> delete(String name);
  String readApiUrl();
}
