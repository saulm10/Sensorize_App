import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/services/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: SupabaseService)
class SupabaseServiceImpl implements SupabaseService {
  final SecureStorajeService _secureStorajeService;
  late final SupabaseClient _dbCon = Supabase.instance.client;

  SupabaseServiceImpl(this._secureStorajeService) {
    Supabase.initialize(
      url: _secureStorajeService.readApiUrl(),
      anonKey: _secureStorajeService.readApiKey(),
    );
  }

  @override
  SupabaseClient getConexion() {
    return _dbCon;
  }

  @override
  Future<AuthResponse?> signUpWithEmail(String email, String password) async {
    try {
      final response = await _dbCon.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      debugPrint('Error en el registro: $e');
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      _dbCon.auth.signOut();
    } catch (e) {
      debugPrint('Error al cerrar sesión: $e');
    }
  }
}
