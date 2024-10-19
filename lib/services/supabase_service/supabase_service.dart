import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseService {
  SupabaseClient getConexion();
  Future<AuthResponse?> signUpWithEmail(String email, String password);
  Future<void> signOut();
}
