import 'package:sensorize/api/api_repository.dart';
import 'package:sensorize/database/tables/aa_tables.dart';

mixin SilosEndpoint implements ApiDependencies {
  Future<List<Map<String, dynamic>>> getSilos() async {
    return await supabaseService.getAll(Silos.collectionName) ?? [];
  }
}
