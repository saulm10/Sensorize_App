import 'package:isar/isar.dart';

part 'centros.g.dart';

@Collection()
class Centros {
  @ignore
  static const String collectionName = 'Centros';

  Id id_ = Isar.autoIncrement;
  late String idCentro;
  late String nombreCentro;

  static Centros fromMap(Map<String, dynamic> data) {
    final centro = Centros()
      ..nombreCentro = data['nombreCentro'] as String
      ..idCentro = data['idCentro'] as String;
    return centro;
  }

  static List<Centros> fromMapList(List<Map<String, dynamic>> dataList) {
    return dataList.map((data) => fromMap(data)).toList();
  }
}
