import 'package:sensorize/api/api_repository.dart';
import 'package:sensorize/config/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

mixin AuthEndpoint implements ApiDependencies {
  Future<AuthResponse?> signUpWithEmail(String email, String password) async {
    return await supabaseService.signUpWithEmail(
      email,
      password,
    );
  }

  Future<AuthResponse?> signUpAuto() async {
    return await supabaseService.signUpWithEmail(
      await storage.read(Constants.login),
      await storage.read(Constants.password),
    );
  }

  Future<void> signOut() async {
    await supabaseService.signOut();
  }
}
