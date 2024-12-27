import 'package:injectable/injectable.dart';
import 'package:sensorize/api/api_manager_impl.dart';
import 'package:sensorize/config/constants.dart';
import 'package:sensorize/database/aa_tables.dart';
import 'package:sensorize/models/model.dart';
import 'package:sensorize/services/local_db_service/deserialize.dart';
import 'package:sensorize/services/services.dart';

@Singleton()
class SincService {
  final ApiManagerImpl _apiManager;
  final LocalDbService _localDbService;
  final SecureStorajeService _secureStorajeService;

  SincService(
    this._apiManager,
    this._localDbService,
    this._secureStorajeService,
  );

  localSinc() async {
    ResultDto result = await _apiManager.sincData();
    if (result.ok) {
      SincDto sinc = sincDtoFromJson(result.data!);
      await sincLiveStock(sinc);
      await sincSilos(sinc);
    }
  }

  sincLiveStock(SincDto sinc) async {
    await _localDbService.deleteAll<Farm>();
    Farm newLivestock = Deserialize.farmFromLocalLiveStock(sinc.livestockDto);
    _localDbService.save<Farm>(newLivestock);
  }

  sincSilos(SincDto sinc) async {
    // Obtén todos los silos existentes de la base de datos local
    final existingSilos = await _localDbService.getAll<Silos>();
    final Map<int, Silos> siloMap = {
      for (var silo in existingSilos) silo.id: silo
    };

    List<Silos> updatedSilos = [];
    for (var siloDto in sinc.livestockDto.siloDto) {
      final newSilo = Deserialize.siloFromLocalSilo(siloDto);
      if (siloMap.containsKey(newSilo.id)) {
        final existingSilo = siloMap[newSilo.id]!;
        existingSilo.risk = newSilo.risk;
        existingSilo.volumen = newSilo.volumen;
        existingSilo.height = newSilo.height;
        existingSilo.measures = await sincMeasuresSilo(existingSilo.id);
        updatedSilos.add(existingSilo);
      } else {
        newSilo.measures = await sincMeasuresSilo(newSilo.id);
        updatedSilos.add(newSilo);
      }
    }

    // Guarda los cambios en la base de datos local
    await _localDbService.saveAll<Silos>(updatedSilos);
  }

  Future<List<Measures>> sincMeasuresSilo(int idSilo) async {
    List<Measures> measures = [];
    ResultDto resultDto = await _apiManager.getMeasuresSilo(idSilo);
    if (resultDto.ok) {
      List<MeasuresDto> measuresListDto = measuresDtoFromJson(resultDto.data!);
      for (var measuresDto in measuresListDto) {
        measures.add(Deserialize.measuresFromMeasuresDto(measuresDto));
      }
    }
    return measures;
  }

  Future<void> signOut() async {
    _secureStorajeService.delete(Constants.login);
    _secureStorajeService.delete(Constants.password);
    _secureStorajeService.delete(Constants.token);
    _localDbService.cleanDb();
  }
}
