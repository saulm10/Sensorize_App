abstract class LocalDbService {
  Future<dynamic> get dbCon;
  Future<T?> getFirst<T>();
  Future<List<T>> getAll<T>();
  Future<T?> getById<T>(dynamic id);
  Future<void> deleteAll<T>();
  Future<bool> deleteById<T>(dynamic id);
  Future<int> save<T>(T entity);
  Future<List<int>> saveAll<T>(List<T> entities);
  Future<int> update<T>(T entity);
  Future<List<int>> updateAll<T>(List<T> entities);
  Future<void> saveFromJson<T>(List<Map<String, dynamic>> jsons);
  Future<void> getCount<T>();
  Future<void> cleanDb();
}
