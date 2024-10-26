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
    String password = await storage.read(Constants.password);
    String login = await storage.read(Constants.login);
    if (login.isNotEmpty && password.isNotEmpty) {
      return await supabaseService.signUpWithEmail(
        login,
        password,
      );
    } else {
      return null;
    }
  }

  Future<void> signOut() async {
    storage.delete(Constants.login);
    storage.delete(Constants.password);
    localDbService.cleanDb();
    supabaseService.signOut();
  }
}
