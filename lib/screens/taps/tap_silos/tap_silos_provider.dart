import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:sensorize/config/di_config/di_config.dart';

import '../../../database/aa_tables.dart';
import '../../../services/services.dart';

@Injectable()
class TapSilosProvider extends ChangeNotifier {
  final LocalDbService _localDbService;

  final List<Silos> silos = [];
  Filtrado filterstate = Filtrado.alfabetico;

  TapSilosProvider(this._localDbService) {
    getSilos();
  }

  getSilos() async {
    silos.addAll(await _localDbService.getAll<Silos>());
    notifyListeners();
  }

  onChipTap(Filtrado filterTipe) async {
    switch (filterTipe) {
      case Filtrado.masLlenos:
        silos.sort((a, b) => b.volumen.compareTo(a.volumen));
        filterstate = Filtrado.masLlenos;
        break;
      case Filtrado.menosLlenos:
        silos.sort((a, b) => a.volumen.compareTo(b.volumen));
        filterstate = Filtrado.menosLlenos;
        break;
      default:
        silos.sort((a, b) => a.siloName.compareTo(b.siloName));
        filterstate = Filtrado.alfabetico;
    }
    notifyListeners();
  }

  static TapSilosProvider get() {
    return Injector.F<TapSilosProvider>();
  }
}

enum Filtrado {
  masLlenos,
  menosLlenos,
  alfabetico,
}
