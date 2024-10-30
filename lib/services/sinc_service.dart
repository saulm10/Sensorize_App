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
    await sincMediciones();
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

  sincMediciones() async {
    List<Silos> silos = await _localDbService.getAll<Silos>();
    for (var silo in silos) {
      List<Mediciones> medicionesAux = Mediciones.fromMapList(
        await _apiRepository.getMediodionesSilo(silo.idSilo),
      );
      silo.mediciones = medicionesAux;
      _localDbService.update(silo);
    }
  }
}
