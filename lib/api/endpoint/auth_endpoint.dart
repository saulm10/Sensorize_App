import 'package:sensorize/api/api_manager.dart';
import 'package:sensorize/config/constants.dart';
import 'package:sensorize/models/model.dart';

mixin AuthEndpoint implements ApiManager {
  Future<ResultDto?> signUpWithEmail(LoginInputDto inputDto) async {
    return await httpService.post('login', inputDto.toJson());
  }

  Future<ResultDto?> signUpAuto() async {
    String password = await storage.read(Constants.password);
    String login = await storage.read(Constants.login);

    LoginInputDto inputDto = LoginInputDto(
      login: login,
      password: password,
    );

    if (login.isNotEmpty && password.isNotEmpty) {
      return await httpService.post('login', inputDto.toJson());
    } else {
      return null;
    }
  }
}
