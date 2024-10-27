import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseService {
  SupabaseClient getConexion();
  Future<List<Map<String, dynamic>>?> getAll(String tableName);
  Future<AuthResponse?> signUpWithEmail(String email, String password);
  Future<bool?> resetPassword(String enmail);
  Future<void> signOut();
}
