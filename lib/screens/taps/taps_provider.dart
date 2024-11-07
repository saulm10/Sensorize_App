import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/config/di_config/di_config.dart';
import 'package:sensorize/database/aa_tables.dart';
import 'package:sensorize/screens/screens.dart';
import 'package:sensorize/services/services.dart';

@Injectable()
class TapsProvider extends ChangeNotifier {
  final SincService _sincService;
  final LocalDbService _localDbService;
  final NavigatorService _navigatorService;

  PageController pageController = PageController();
  int currentPage = 0;
  bool sincornizado = false;

  Centros? centro;
  List<Silos> silos = [];

  TapsProvider(
    this._sincService,
    this._localDbService,
    this._navigatorService,
  ) {
    sinc();
  }

  sinc() async {
    await _sincService.sincTables();
    await getCentro();
    sincornizado = true;
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

  navigateToNotifications() {
    _navigatorService.showDialogModel(
      const NotificationsScreen(),
    );
  }

  static TapsProvider get() {
    return Injector.F<TapsProvider>();
  }
}
