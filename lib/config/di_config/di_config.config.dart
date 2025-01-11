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
import 'package:sensorize/config/globals.dart' as _i5;
import 'package:sensorize/database/aa_tables.dart' as _i25;
import 'package:sensorize/screens/login/check_auth/check_auth_provider.dart'
    as _i19;
import 'package:sensorize/screens/login/login/login_provider.dart' as _i20;
import 'package:sensorize/screens/notifications/notifications_provider.dart'
    as _i17;
import 'package:sensorize/screens/profile/profile_provider.dart' as _i23;
import 'package:sensorize/screens/silo_detail/silo_detail_provider.dart'
    as _i24;
import 'package:sensorize/screens/taps/tap_home/tap_home_provider.dart' as _i11;
import 'package:sensorize/screens/taps/tap_silos/tap_silos_provider.dart'
    as _i12;
import 'package:sensorize/screens/taps/taps_provider.dart' as _i22;
import 'package:sensorize/services/diolog_service/dialog_service_impl.dart'
    as _i15;
import 'package:sensorize/services/firebase_notifications_service/firebase_notifications_service.dart'
    as _i3;
import 'package:sensorize/services/firebase_notifications_service/firebase_notifications_service_impl.dart'
    as _i4;
import 'package:sensorize/services/https_service/https_service_impl.dart'
    as _i16;
import 'package:sensorize/services/local_db_service/local_db_service.dart'
    as _i6;
import 'package:sensorize/services/local_db_service/local_db_service_impl.dart'
    as _i7;
import 'package:sensorize/services/navigator_service/navigator_service_impl.dart'
    as _i9;
import 'package:sensorize/services/secure_storaje_service/secure_storaje_service_impl.dart'
    as _i10;
import 'package:sensorize/services/services.dart' as _i8;
import 'package:sensorize/services/sinc_service.dart' as _i21;
import 'package:sensorize/services/toast_service/toast_service.dart' as _i13;
import 'package:sensorize/services/toast_service/toast_service_impl.dart'
    as _i14;

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
    gh.singleton<_i3.FirebaseNotificationsService>(
        () => _i4.FirebaseNotificationsServiceImpl());
    gh.factory<_i5.Globals>(() => _i5.Globals());
    gh.singleton<_i6.LocalDbService>(() => _i7.LocalDbServiceImpl());
    gh.singleton<_i8.NavigatorService>(() => _i9.NavigatorServiceImpl());
    gh.singleton<_i8.SecureStorajeService>(
        () => _i10.SecureStorajeServiceImpl());
    gh.factory<_i11.TapHomeProvider>(() => _i11.TapHomeProvider(
          gh<_i8.LocalDbService>(),
          gh<_i8.NavigatorService>(),
        ));
    gh.factory<_i12.TapSilosProvider>(() => _i12.TapSilosProvider(
          gh<_i8.LocalDbService>(),
          gh<_i8.NavigatorService>(),
        ));
    gh.singleton<_i13.ToastService>(() => _i14.ToastServiceImpl());
    gh.singleton<_i8.DialogService>(
        () => _i15.DialogServiceImpl(gh<_i8.NavigatorService>()));
    gh.singleton<_i8.HttpsService>(() => _i16.HttpsServiceImpl(
          gh<_i8.SecureStorajeService>(),
          gh<_i8.ToastService>(),
        ));
    gh.factory<_i17.NotificationsProvider>(() => _i17.NotificationsProvider(
          gh<_i8.LocalDbService>(),
          gh<_i8.DialogService>(),
        ));
    gh.singleton<_i18.ApiManagerImpl>(() => _i18.ApiManagerImpl(
          gh<_i8.HttpsService>(),
          gh<_i8.SecureStorajeService>(),
        ));
    gh.factory<_i19.CheckAuthProvider>(() => _i19.CheckAuthProvider(
          gh<_i18.ApiManagerImpl>(),
          gh<_i8.NavigatorService>(),
          gh<_i8.SecureStorajeService>(),
        ));
    gh.factory<_i20.LoginProvider>(() => _i20.LoginProvider(
          gh<_i18.ApiManagerImpl>(),
          gh<_i8.NavigatorService>(),
          gh<_i8.SecureStorajeService>(),
          gh<_i8.ToastService>(),
          gh<_i8.FirebaseNotificationsService>(),
        ));
    gh.singleton<_i21.SincService>(() => _i21.SincService(
          gh<_i18.ApiManagerImpl>(),
          gh<_i8.LocalDbService>(),
          gh<_i8.SecureStorajeService>(),
        ));
    gh.factory<_i22.TapsProvider>(() => _i22.TapsProvider(
          gh<_i8.SincService>(),
          gh<_i8.LocalDbService>(),
          gh<_i8.NavigatorService>(),
        ));
    gh.factory<_i23.ProfileProvider>(() => _i23.ProfileProvider(
          gh<_i8.NavigatorService>(),
          gh<_i8.DialogService>(),
          gh<_i8.SecureStorajeService>(),
          gh<_i8.LocalDbService>(),
          gh<_i8.SincService>(),
        ));
    gh.factoryParam<_i24.SiloDetailProvider, _i25.Silos, dynamic>((
      silo,
      _,
    ) =>
        _i24.SiloDetailProvider(
          silo,
          gh<_i8.LocalDbService>(),
          gh<_i8.DialogService>(),
          gh<_i18.ApiManagerImpl>(),
          gh<_i8.ToastService>(),
          gh<_i8.SincService>(),
          gh<_i8.NavigatorService>(),
        ));
    return this;
  }
}
