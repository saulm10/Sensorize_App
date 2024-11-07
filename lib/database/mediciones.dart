import 'package:isar/isar.dart';
part 'mediciones.g.dart';

@embedded
class Mediciones {
  @ignore
  static const String collectionName = 'Mediciones';

  late String idMedicion;
  late String idSensor;
  late int medicion;
  late DateTime fechaResgistro;

  static Mediciones fromMap(Map<String, dynamic> data) {
    final centro = Mediciones()
      ..idMedicion = data['idMedicion'] as String
      ..idSensor = data['idSensor'] as String
      ..medicion = data['resultado'] as int
      ..fechaResgistro = DateTime.parse(data['fechaRegistro']);
    return centro;
  }

  static List<Mediciones> fromMapList(List<Map<String, dynamic>> dataList) {
    return dataList.map((data) => fromMap(data)).toList();
  }
}
