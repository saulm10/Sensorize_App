import 'package:isar/isar.dart';
part 'silos.g.dart';

@collection
class Silos {
  late Id id;
  late String siloName;
  late double height;
  late int volumen;
  late int risk;
  String color = "255, 235, 59";
  List<Measures> measures = [];
  late Sensor sensor;
}

@embedded
class Sensor {
  late int id;
}

@embedded
class Measures {
  late int id;
  late double result;
  late DateTime date;
  late bool fullFilled;
}
