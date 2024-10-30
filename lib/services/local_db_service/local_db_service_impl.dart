import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sensorize/services/local_db_service/local_db_service.dart';

import '../../database/tables/aa_tables.dart';

@Singleton(as: LocalDbService)
class LocalDbServiceImpl implements LocalDbService {
  @override
  late final Future<Isar> dbCon;

  LocalDbServiceImpl() {
    dbCon = _openDB();
  }

  Future<Isar> _openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [
          SilosSchema,
          CentrosSchema,
        ],
        inspector: kDebugMode,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<List<T>> getAll<T>() async {
    final isar = await dbCon;

    return isar.writeTxnSync(() => isar.collection<T>().where().findAllSync());
  }

  @override
  Future<T?> getById<T>(dynamic id) async {
    final isar = await dbCon;

    return isar.writeTxnSync(() => isar.collection<T>().getSync(id));
  }

  @override
  Future<void> deleteAll<T>() async {
    final isar = await dbCon;

    isar.writeTxnSync(() => isar.collection<T>().clearSync());
  }

  @override
  Future<bool> deleteById<T>(dynamic id) async {
    final isar = await dbCon;

    return isar.writeTxnSync(() => isar.collection<T>().deleteSync(id));
  }

  @override
  Future<int> save<T>(T entity) async {
    final isar = await dbCon;

    return isar.writeTxnSync(() => isar.collection<T>().putSync(entity));
  }

  @override
  Future<List<int>> saveAll<T>(List<T> entities) async {
    final isar = await dbCon;

    return isar.writeTxnSync(() => isar.collection<T>().putAllSync(entities));
  }

  @override
  Future<void> saveFromJson<T>(List<Map<String, dynamic>> jsons) async {
    final isar = await dbCon;

    isar.writeTxnSync(() => isar.collection<T>().importJsonSync(jsons));
  }

  @override
  Future<int> update<T>(T entity) {
    return save<T>(entity);
  }

  @override
  Future<List<int>> updateAll<T>(List<T> entities) {
    return saveAll<T>(entities);
  }

  @override
  Future<void> getCount<T>() async {
    final isar = await dbCon;

    isar.writeTxnSync(() => isar.collection<T>().countSync());
  }

  @override
  Future<void> cleanDb() async {
    final isar = await dbCon;
    await isar.writeTxn(() => isar.clear());
  }
}
