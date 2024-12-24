import 'package:sensorize/database/aa_tables.dart';
import 'package:sensorize/models/Dto/sincDto.dart';

class Deserialize {
  static Farm farmFromLocalLiveStock(LivestockDto dto) {
    return Farm()
      ..id = dto.id
      ..name = dto.name;
  }

  static Silos siloFromLocalSilo(SiloDto dto) {
    return Silos()
      ..id = dto.id
      ..siloName = dto.siloName
      ..height = dto.height
      ..volumen = dto.volume
      ..risk = dto.risk
      ..sensor = (Sensor()..id = dto.sensor.id);
  }
}