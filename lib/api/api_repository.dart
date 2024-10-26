import 'package:injectable/injectable.dart';
import 'package:sensorize/api/endpoint/aa_endpoints.dart';
import 'package:sensorize/services/services.dart';

@singleton
class ApiRepository
    with AuthEndpoint, MedicionesEndpoint, SilosEndpoint, CentrosEndpoint
    implements ApiDependencies {
  final SecureStorajeService _storage;

  final LocalDbService _localDbService;

  final SupabaseService _supabaseService;

  final ToastService _toastService;

  @override
  SecureStorajeService get storage => _storage;

  @override
  LocalDbService get localDbService => _localDbService;

  @override
  SupabaseService get supabaseService => _supabaseService;

  @override
  ToastService get toastService => _toastService;

  ApiRepository(
    this._storage,
    this._supabaseService,
    this._toastService,
    this._localDbService,
  );
}

abstract class ApiDependencies {
  SecureStorajeService get storage;
  SupabaseService get supabaseService;
  ToastService get toastService;
  LocalDbService get localDbService;
}
