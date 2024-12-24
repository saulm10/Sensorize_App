import 'package:isar/isar.dart';
part 'silos.g.dart';

@collection
class Silos {
  late Id id;
  late String siloName;
  late double height;
  late int volumen;
  late int risk;
  late Sensor sensor;
}

@embedded
class Sensor {
  late int id;
}
