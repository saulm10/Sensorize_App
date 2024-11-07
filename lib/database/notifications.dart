import 'package:isar/isar.dart';

part 'notifications.g.dart';

@Collection()
class Notifications {
  Id id_ = Isar.autoIncrement;
  late String title;
  late String body;
  late DateTime date;
  late String idSilo;
}
