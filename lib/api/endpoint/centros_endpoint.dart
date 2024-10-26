import 'package:sensorize/api/api_repository.dart';
import 'package:sensorize/database/tables/aa_tables.dart';

mixin CentrosEndpoint implements ApiDependencies {
  Future<List<Map<String, dynamic>>> getCentro() async {
    return await supabaseService.getAll(Centros.collectionName) ?? [];
  }
}
