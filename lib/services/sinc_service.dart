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
      SincDto sinc = SincDto.fromJson(result.data ?? {});
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
    await _localDbService.deleteAll<Silos>();
    List<Silos> newSilos = [];
    for (var silo in sinc.livestockDto.siloDto) {
      newSilos.add(Deserialize.siloFromLocalSilo(silo));
    }
    _localDbService.saveAll<Silos>(newSilos);
  }

  Future<void> signOut() async {
    _secureStorajeService.delete(Constants.login);
    _secureStorajeService.delete(Constants.password);
    _secureStorajeService.delete(Constants.token);
    _localDbService.cleanDb();
  }
}
