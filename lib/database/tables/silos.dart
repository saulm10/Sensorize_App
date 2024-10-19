import 'package:isar/isar.dart';
part 'silos.g.dart';

@collection
class Silos {
  Id id_ = Isar.autoIncrement;
  late String idSilo;
  late String idSensor;
  late String nombre;
  late int altura;
  late int volumne;
  late int riesgo;
}
