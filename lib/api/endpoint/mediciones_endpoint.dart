import 'package:sensorize/api/api_repository.dart';
import 'package:sensorize/database/tables/aa_tables.dart';

mixin MedicionesEndpoint implements ApiDependencies {
  Future<List<Map<String, dynamic>>> getMediodionesSilo(String idSilo) async {
    return await supabaseService.getAllFiltered(
          Mediciones.collectionName,
          'idSilo',
          idSilo,
        ) ??
        [];
  }
}
