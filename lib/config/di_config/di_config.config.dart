// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sensorize/api/api_repository.dart' as _i13;
import 'package:sensorize/database/aa_tables.dart' as _i20;
import 'package:sensorize/screens/login/check_auth/check_auth_provider.dart'
    as _i14;
import 'package:sensorize/screens/login/login/login_provider.dart' as _i16;
import 'package:sensorize/screens/notifications/notifications_provider.dart'
    as _i17;
import 'package:sensorize/screens/profile/profile_provider.dart' as _i18;
import 'package:sensorize/screens/silo_detail/silo_detail_provider.dart'
    as _i19;
import 'package:sensorize/screens/taps/tap_home/tap_home_provider.dart' as _i9;
import 'package:sensorize/screens/taps/tap_silos/tap_silos_provider.dart'
    as _i10;
import 'package:sensorize/screens/taps/taps_provider.dart' as _i22;
import 'package:sensorize/services/diolog_service/dialog_service_impl.dart'
    as _i15;
import 'package:sensorize/services/local_db_service/local_db_service.dart'
    as _i3;
import 'package:sensorize/services/local_db_service/local_db_service_impl.dart'
    as _i4;
import 'package:sensorize/services/navigator_service/navigator_service_impl.dart'
    as _i6;
import 'package:sensorize/services/secure_storaje_service/secure_storaje_service_impl.dart'
    as _i7;
import 'package:sensorize/services/services.dart' as _i5;
import 'package:sensorize/services/sinc_service.dart' as _i21;
import 'package:sensorize/services/supabase_service/supabase_service_impl.dart'
    as _i8;
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
    gh.singleton<_i3.LocalDbService>(() => _i4.LocalDbServiceImpl());
    gh.singleton<_i5.NavigatorService>(() => _i6.NavigatorServiceImpl());
    gh.singleton<_i5.SecureStorajeService>(
        () => _i7.SecureStorajeServiceImpl());
    gh.singleton<_i5.SupabaseService>(
        () => _i8.SupabaseServiceImpl(gh<_i5.SecureStorajeService>()));
    gh.factory<_i9.TapHomeProvider>(() => _i9.TapHomeProvider(
          gh<_i5.LocalDbService>(),
          gh<_i5.NavigatorService>(),
        ));
    gh.factory<_i10.TapSilosProvider>(
        () => _i10.TapSilosProvider(gh<_i5.LocalDbService>()));
    gh.singleton<_i11.ToastService>(() => _i12.ToastServiceImpl());
    gh.singleton<_i13.ApiRepository>(() => _i13.ApiRepository(
          gh<_i5.SecureStorajeService>(),
          gh<_i5.SupabaseService>(),
          gh<_i5.ToastService>(),
          gh<_i5.LocalDbService>(),
        ));
    gh.factory<_i14.CheckAuthProvider>(() => _i14.CheckAuthProvider(
          gh<_i13.ApiRepository>(),
          gh<_i5.NavigatorService>(),
        ));
    gh.singleton<_i5.DialogService>(
        () => _i15.DialogServiceImpl(gh<_i5.NavigatorService>()));
    gh.factory<_i16.LoginProvider>(() => _i16.LoginProvider(
          gh<_i13.ApiRepository>(),
          gh<_i5.NavigatorService>(),
          gh<_i5.SecureStorajeService>(),
          gh<_i5.ToastService>(),
          gh<_i5.DialogService>(),
        ));
    gh.factory<_i17.NotificationsProvider>(() => _i17.NotificationsProvider(
          gh<_i5.LocalDbService>(),
          gh<_i5.DialogService>(),
        ));
    gh.factory<_i18.ProfileProvider>(() => _i18.ProfileProvider(
          gh<_i13.ApiRepository>(),
          gh<_i5.NavigatorService>(),
          gh<_i5.DialogService>(),
          gh<_i5.SecureStorajeService>(),
        ));
    gh.factoryParam<_i19.SiloDetailProvider, _i20.Silos, dynamic>((
      silo,
      _,
    ) =>
        _i19.SiloDetailProvider(
          silo,
          gh<_i5.LocalDbService>(),
          gh<_i5.DialogService>(),
        ));
    gh.singleton<_i21.SincService>(() => _i21.SincService(
          gh<_i13.ApiRepository>(),
          gh<_i5.LocalDbService>(),
        ));
    gh.factory<_i22.TapsProvider>(() => _i22.TapsProvider(
          gh<_i5.SincService>(),
          gh<_i5.LocalDbService>(),
          gh<_i5.NavigatorService>(),
        ));
    return this;
  }
}
