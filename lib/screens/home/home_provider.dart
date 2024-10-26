import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/config/di_config/di_config.dart';
import 'package:sensorize/database/tables/aa_tables.dart';
import 'package:sensorize/screens/screens.dart';
import 'package:sensorize/services/services.dart';

@Injectable()
class HomeProvider extends ChangeNotifier {
  final SincService _sincService;
  final LocalDbService _localDbService;
  final NavigatorService _navigatorService;
  PageController pageController = PageController();
  int currentPage = 0;

  Centros? centro;
  List<Silos> silos = [];

  HomeProvider(
    this._sincService,
    this._localDbService,
    this._navigatorService,
  ) {
    sinc();
  }

  sinc() async {
    await _sincService.sincTables();
    await getCentro();
    notifyListeners();
  }

  getCentro() async {
    List<Centros> centrosAux = await _localDbService.getAll<Centros>();
    centro = centrosAux.first;
  }

  onScroll(int index) async {
    currentPage = index;
    notifyListeners();
  }

  onItemSelecctedTap(int index) async {
    await pageController.animateToPage(
      index,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 270),
    );
    notifyListeners();
  }

  navigateToProfile() {
    _navigatorService.showDialogModel(
      const ProfileScreen(),
    );
  }

  static HomeProvider get() {
    return Injector.F<HomeProvider>();
  }
}
