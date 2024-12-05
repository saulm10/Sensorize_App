import 'package:isar/isar.dart';

part 'centros.g.dart';

@Collection()
class Centros {
  @ignore
  static const String collectionName = 'Centros';

  Id id_ = Isar.autoIncrement;
  late String idCentro;
  late String nombreCentro;

  Centros() {
    nombreCentro = 'Nombre Centro';
  }

  String getInitials() {
    List<String> words = nombreCentro.trim().split(' ');

    if (words.length < 2) {
      return words[0][0].toUpperCase() + words[0][1].toUpperCase();
    } else {
      return words[0][0].toUpperCase() + words[1][0].toUpperCase();
    }
  }

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
