import 'package:injectable/injectable.dart';
import 'package:sensorize/api/endpoint/aa_endpoints.dart';
import 'package:sensorize/services/services.dart';

@singleton
class ApiRepository
    with AuthEndpoint, MedicionesEndpoint, SilosEndpoint
    implements ApiDependencies {
  final SecureStorajeService _storage;

  final SupabaseService _supabaseService;

  final ToastService _toastService;

  @override
  SecureStorajeService get storage => _storage;

  @override
  SupabaseService get supabaseService => _supabaseService;

  @override
  ToastService get toastService => _toastService;

  ApiRepository(
    this._storage,
    this._supabaseService,
    this._toastService,
  );
}

abstract class ApiDependencies {
  SecureStorajeService get storage;
  SupabaseService get supabaseService;
  ToastService get toastService;
}
