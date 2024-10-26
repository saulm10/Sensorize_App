import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/config/di_config/di_config.dart';
import 'package:sensorize/database/tables/aa_tables.dart';
import 'package:sensorize/services/services.dart';

@Injectable()
class Tap1Provider extends ChangeNotifier {
  final LocalDbService _localDbService;

  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  int lastPosition = -1;
  List<Silos?> silos = [];

  Tap1Provider(this._localDbService) {
    notifyListeners();
  }

  Future<List<Silos?>> getSilos() async {
    if (silos.isEmpty) {
      silos = await _localDbService.getAll<Silos>();
      return silos;
    } else {
      return silos;
    }
  }

  double beginVolumn() {
    if (lastPosition >= 0) {
      return silos[lastPosition]!.volumen.toDouble();
    } else {
      return 0;
    }
  }

  double endVolumn() {
    if (currentIndex >= 0) {
      return silos[currentIndex]!.volumen.toDouble();
    } else {
      return 0;
    }
  }

  onArrowTapRight() async {
    await pageController.nextPage(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 270),
    );
    lastPosition++;
    currentIndex++;
    notifyListeners();
  }

  onArrowTapLeft() async {
    await pageController.previousPage(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 270),
    );
    lastPosition--;
    currentIndex--;
    // notifyListeners();
  }

  static Tap1Provider get() {
    return Injector.F<Tap1Provider>();
  }
}
