import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sensorize/database/tables/aa_tables.dart';
import 'package:sensorize/services/services.dart';

@lazySingleton
class LocalDbRepository extends LocalDbServiceImpl implements LocalDbService {
  LocalDbRepository() : super(LocalDbRepository._openDB());

  static Future<Isar> _openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [
          MedicionesSchema,
          SilosSchema,
        ],
        inspector: kDebugMode,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
