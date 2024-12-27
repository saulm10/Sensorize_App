import 'package:sensorize/api/api_manager.dart';

import '../../models/model.dart';

mixin MeasuresEndpoint implements ApiManager {
  Future<ResultDto> getMeasuresSilo(int siloId) async {
    return await httpService.get(
      'v1/measures/getfromsilos',
      queryParameters: {'siloId': siloId.toString()},
    );
  }
}
