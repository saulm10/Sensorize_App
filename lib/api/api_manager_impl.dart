import 'package:injectable/injectable.dart';
import 'package:sensorize/api/api_manager.dart';
import 'package:sensorize/api/endpoint/sinc_endpoint.dart';
import 'package:sensorize/services/services.dart';

import 'endpoint/auth_endpoint.dart';
import 'endpoint/mediciones_endpoint.dart';
import 'endpoint/silos_endpoint.dart';

@singleton
class ApiManagerImpl
    with AuthEndpoint, MedicionesEndpoint, SilosEndpoint, SincEndpoint
    implements ApiManager {
  final HttpsService _httpsService;
  final SecureStorajeService _storage;

  @override
  SecureStorajeService get storage => _storage;

  @override
  HttpsService get httpService => _httpsService;

  ApiManagerImpl(
    this._httpsService,
    this._storage,
  );
}
