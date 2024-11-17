import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sensorize/config/di_config/di_config.dart';
import 'package:sensorize/database/aa_tables.dart';
import 'package:sensorize/services/services.dart';

@Injectable()
class SiloDetailProvider extends ChangeNotifier {
  final LocalDbService _localDbService;
  final DialogService _dialogService;
  Silos silo;

  SiloDetailProvider(
    @factoryParam this.silo,
    this._localDbService,
    this._dialogService,
  );

  static SiloDetailProvider get(Silos? silo) {
    return Injector.L()<SiloDetailProvider>(param1: silo);
  }
}
