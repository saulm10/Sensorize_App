import 'package:isar/isar.dart';
import 'package:sensorize/database/tables/aa_tables.dart';
part 'silos.g.dart';

@collection
class Silos {
  @ignore
  static const String collectionName = 'Silos';

  Id id_ = Isar.autoIncrement;
  late String idSilo;
  late String idSensor;
  late String nombre;
  late int altura;
  late int volumen;
  late int riesgo;
  late List<Mediciones> mediciones = [];

  static Silos fromMap(Map<String, dynamic> data) {
    final centro = Silos()
      ..idSilo = data['idSilo'] as String
      ..idSensor = data['idSensor'] as String
      ..nombre = data['nombre'] as String
      ..altura = data['altura'] as int
      ..volumen = data['volumen'] as int
      ..riesgo = data['riesgo'] as int;
    return centro;
  }

  static List<Silos> fromMapList(List<Map<String, dynamic>> dataList) {
    return dataList.map((data) => fromMap(data)).toList();
  }
}
