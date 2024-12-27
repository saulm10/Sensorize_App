import 'package:sensorize/api/api_manager.dart';
import 'package:sensorize/models/model.dart';

mixin SilosEndpoint implements ApiManager {
  Future<ResultDto?> updateSiloRisk(SiloRiskInputDto inputDto) async {
    return await httpService.patch('v1/silos/update', inputDto.toJson());
  }
}
