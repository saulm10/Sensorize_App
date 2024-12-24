import 'package:sensorize/api/api_manager.dart';
import 'package:sensorize/config/constants.dart';
import 'package:sensorize/models/model.dart';

mixin SincEndpoint implements ApiManager {
  Future<ResultDto> sincData() async {
    String login = await storage.read(Constants.login);

    return await httpService.get(
      'v1/user',
      queryParameters: {'login': login},
    );
  }
}
