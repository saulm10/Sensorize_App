import 'package:isar/isar.dart';
part 'mediciones.g.dart';

@collection
class Mediciones {
  Id id_ = Isar.autoIncrement;
  late String idMedicion;
  late DateTime fechaRegistro;
  late String idSilo;
  late int resultado;
}
