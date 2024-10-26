import 'package:injectable/injectable.dart';
import 'package:sensorize/api/api_repository.dart';
import 'package:sensorize/database/tables/aa_tables.dart';
import 'package:sensorize/services/services.dart';

@Singleton()
class SincService {
  final ApiRepository _apiRepository;
  final LocalDbService _localDbService;

  SincService(
    this._apiRepository,
    this._localDbService,
  );

  sincTables() async {
    await sincCentros();
    await sincSilos();
  }

  sincCentros() async {
    await _localDbService.deleteAll<Centros>();
    _localDbService.saveAll<Centros>(
        Centros.fromMapList(await _apiRepository.getCentro()));
  }

  sincSilos() async {
    await _localDbService.deleteAll<Silos>();
    _localDbService
        .saveAll<Silos>(Silos.fromMapList(await _apiRepository.getSilos()));
  }
}
