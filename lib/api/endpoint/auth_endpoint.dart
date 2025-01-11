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
    String fcmToken = await storage.read(Constants.fcmToken);

    LoginInputDto inputDto = LoginInputDto(
      login: login,
      password: password,
      tokenApp: fcmToken,
    );

    if (login.isNotEmpty && password.isNotEmpty) {
      return await httpService.post('login', inputDto.toJson());
    } else {
      return null;
    }
  }
}
