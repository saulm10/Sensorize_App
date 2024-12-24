import '../services/services.dart';

abstract class ApiManager {
  SecureStorajeService get storage;
  HttpsService get httpService;
}
