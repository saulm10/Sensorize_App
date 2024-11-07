import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/config/di_config/di_config.dart';
import 'package:sensorize/database/aa_tables.dart';
import 'package:sensorize/services/services.dart';

@Injectable()
class NotificationsProvider extends ChangeNotifier {
  final LocalDbService _localDbService;
  final DialogService _dialogService;

  List<Notifications> notifications = [];

  NotificationsProvider(
    this._localDbService,
    this._dialogService,
  ) {
    getAllNotifications();
  }

  getAllNotifications() async {
    notifications = await _localDbService.getAll<Notifications>();
    notifyListeners();
  }

  deleteNotification(int index) async {
    bool canDelete = await _dialogService.boolDialog(
      'Borrar notificación',
      'Una vez borrada no se recuperará.',
      'Borrar',
      'Cancelar',
    );
    if (canDelete) {
      _localDbService.deleteById<Notifications>(notifications[index].id_);
      notifications.removeAt(index);
    }
    notifyListeners();
  }

  static NotificationsProvider get() {
    return Injector.F<NotificationsProvider>();
  }
}
