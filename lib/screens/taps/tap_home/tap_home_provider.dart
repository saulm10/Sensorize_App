import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/config/di_config/di_config.dart';
import 'package:sensorize/database/aa_tables.dart';
import 'package:sensorize/services/services.dart';

import '../../screens.dart';

@Injectable()
class TapHomeProvider extends ChangeNotifier {
  final LocalDbService _localDbService;
  final NavigatorService _navigatorService;

  PageController pageController = PageController(initialPage: 0);
  Future<List<Silos>>? _silosFuture;
  int currentIndex = 0;
  int lastPosition = -1;

  TapHomeProvider(
    this._localDbService,
    this._navigatorService,
  ) {
    notifyListeners();
  }

  Future<List<Silos>>? getSilos() {
    _silosFuture ??= _localDbService.getAll<Silos>();
    return _silosFuture!;
  }

  // Para forzar la recarga de datos
  void refreshSilos() {
    _silosFuture = null;
    notifyListeners();
  }

  double beginVolumn(List<Silos> silosAux) {
    if (lastPosition >= 0) {
      return silosAux[lastPosition].volumen.toDouble();
    } else {
      return 0;
    }
  }

  double endVolumn(List<Silos> silosAux) {
    if (currentIndex >= 0) {
      return silosAux[currentIndex].volumen.toDouble();
    } else {
      return 0;
    }
  }

  navigateToSiloDetail(List<Silos> silosAux) {
    _navigatorService.showDialogModel(
      SiloDetailScreen(
        siloAux: silosAux[currentIndex],
      ),
    );
  }

  onArrowTapRight() async {
    await pageController.nextPage(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 270),
    );
    lastPosition = currentIndex;
    currentIndex++;
    notifyListeners();
  }

  onArrowTapLeft() async {
    await pageController.previousPage(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 270),
    );
    lastPosition = currentIndex;
    currentIndex--;
    notifyListeners();
  }

  static TapHomeProvider get() {
    return Injector.F<TapHomeProvider>();
  }
}
