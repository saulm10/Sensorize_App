import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/api/api_manager_impl.dart';
import 'package:sensorize/config/di_config/di_config.dart';
import 'package:sensorize/database/aa_tables.dart';
import 'package:sensorize/models/model.dart';
import 'package:sensorize/services/services.dart';

@Injectable()
class SiloDetailProvider extends ChangeNotifier {
  final LocalDbService _localDbService;
  final DialogService _dialogService;
  final ApiManagerImpl _apiManagerImpl;
  final ToastService _toastService;
  Silos silo;
  late int initialRisk;

  SiloDetailProvider(
    @factoryParam this.silo,
    this._localDbService,
    this._dialogService,
    this._apiManagerImpl,
    this._toastService,
  ) {
    initialRisk = silo.risk;
  }

  riskChange(double value) {
    silo.risk = (value * 100).toInt();
    notifyListeners();
  }

  onRiskChange(double value) async {
    bool aceptado = await _dialogService.boolDialog(
      "Aviso",
      "¿Desea actualizar el punto que será reconocido como nivel de riesgo?",
      "Actualizar",
      "Cancelar",
    );
    if (aceptado) {
      SiloRiskInputDto inputDto =
          SiloRiskInputDto(newRisk: (value * 100).toInt(), siloId: silo.id);
      ResultDto? result = await _apiManagerImpl.updateSiloRisk(inputDto);

      if (result != null && result.ok) {
        silo.risk = (value * 100).toInt();
        await _localDbService.update<Silos>(silo);
        _toastService.showToast(
            result.message ?? "Todo correcto", ToastType.success);
      } else {
        _toastService.showToast(
            result?.message ?? "Ocurrió un error", ToastType.error);
      }
    } else {
      silo.risk = initialRisk;
      notifyListeners();
    }
  }

  onColorTap() async {
    String? color = await _dialogService.colorDialog();
    if (color != null) {
      silo.color = color;
      await _localDbService.update<Silos>(silo);
      notifyListeners();
    }
  }

  static SiloDetailProvider get(Silos? silo) {
    return Injector.L()<SiloDetailProvider>(param1: silo);
  }
}
