// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sensorize/api/api_manager_impl.dart' as _i18;
import 'package:sensorize/config/globals.dart' as _i3;
import 'package:sensorize/database/aa_tables.dart' as _i17;
import 'package:sensorize/screens/login/check_auth/check_auth_provider.dart'
    as _i19;
import 'package:sensorize/screens/login/login/login_provider.dart' as _i20;
import 'package:sensorize/screens/notifications/notifications_provider.dart'
    as _i15;
import 'package:sensorize/screens/profile/profile_provider.dart' as _i23;
import 'package:sensorize/screens/silo_detail/silo_detail_provider.dart'
    as _i16;
import 'package:sensorize/screens/taps/tap_home/tap_home_provider.dart' as _i9;
import 'package:sensorize/screens/taps/tap_silos/tap_silos_provider.dart'
    as _i10;
import 'package:sensorize/screens/taps/taps_provider.dart' as _i22;
import 'package:sensorize/services/diolog_service/dialog_service_impl.dart'
    as _i13;
import 'package:sensorize/services/https_service/https_service_impl.dart'
    as _i14;
import 'package:sensorize/services/local_db_service/local_db_service.dart'
    as _i4;
import 'package:sensorize/services/local_db_service/local_db_service_impl.dart'
    as _i5;
import 'package:sensorize/services/navigator_service/navigator_service_impl.dart'
    as _i7;
import 'package:sensorize/services/secure_storaje_service/secure_storaje_service_impl.dart'
    as _i8;
import 'package:sensorize/services/services.dart' as _i6;
import 'package:sensorize/services/sinc_service.dart' as _i21;
import 'package:sensorize/services/toast_service/toast_service.dart' as _i11;
import 'package:sensorize/services/toast_service/toast_service_impl.dart'
    as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.Globals>(() => _i3.Globals());
    gh.singleton<_i4.LocalDbService>(() => _i5.LocalDbServiceImpl());
    gh.singleton<_i6.NavigatorService>(() => _i7.NavigatorServiceImpl());
    gh.singleton<_i6.SecureStorajeService>(
        () => _i8.SecureStorajeServiceImpl());
    gh.factory<_i9.TapHomeProvider>(() => _i9.TapHomeProvider(
          gh<_i6.LocalDbService>(),
          gh<_i6.NavigatorService>(),
        ));
    gh.factory<_i10.TapSilosProvider>(
        () => _i10.TapSilosProvider(gh<_i6.LocalDbService>()));
    gh.singleton<_i11.ToastService>(() => _i12.ToastServiceImpl());
    gh.singleton<_i6.DialogService>(
        () => _i13.DialogServiceImpl(gh<_i6.NavigatorService>()));
    gh.singleton<_i6.HttpsService>(
        () => _i14.HttpsServiceImpl(gh<_i6.SecureStorajeService>()));
    gh.factory<_i15.NotificationsProvider>(() => _i15.NotificationsProvider(
          gh<_i6.LocalDbService>(),
          gh<_i6.DialogService>(),
        ));
    gh.factoryParam<_i16.SiloDetailProvider, _i17.Silos, dynamic>((
      silo,
      _,
    ) =>
        _i16.SiloDetailProvider(
          silo,
          gh<_i6.LocalDbService>(),
          gh<_i6.DialogService>(),
        ));
    gh.singleton<_i18.ApiManagerImpl>(() => _i18.ApiManagerImpl(
          gh<_i6.HttpsService>(),
          gh<_i6.SecureStorajeService>(),
        ));
    gh.factory<_i19.CheckAuthProvider>(() => _i19.CheckAuthProvider(
          gh<_i18.ApiManagerImpl>(),
          gh<_i6.NavigatorService>(),
          gh<_i6.SecureStorajeService>(),
        ));
    gh.factory<_i20.LoginProvider>(() => _i20.LoginProvider(
          gh<_i18.ApiManagerImpl>(),
          gh<_i6.NavigatorService>(),
          gh<_i6.SecureStorajeService>(),
          gh<_i6.ToastService>(),
        ));
    gh.singleton<_i21.SincService>(() => _i21.SincService(
          gh<_i18.ApiManagerImpl>(),
          gh<_i6.LocalDbService>(),
          gh<_i6.SecureStorajeService>(),
        ));
    gh.factory<_i22.TapsProvider>(() => _i22.TapsProvider(
          gh<_i6.SincService>(),
          gh<_i6.LocalDbService>(),
          gh<_i6.NavigatorService>(),
        ));
    gh.factory<_i23.ProfileProvider>(() => _i23.ProfileProvider(
          gh<_i6.NavigatorService>(),
          gh<_i6.DialogService>(),
          gh<_i6.SecureStorajeService>(),
          gh<_i6.LocalDbService>(),
          gh<_i6.SincService>(),
        ));
    return this;
  }
}
