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
import 'package:sensorize/database/local_db_repository.dart' as _i4;
import 'package:sensorize/screens/home/home_provider.dart' as _i3;
import 'package:sensorize/screens/login/check_auth/check_auth_provider.dart'
    as _i14;
import 'package:sensorize/screens/login/login/login_provider.dart' as _i15;
import 'package:sensorize/services/navigator_service/navigator_service.dart'
    as _i5;
import 'package:sensorize/services/navigator_service/navigator_service_impl.dart'
    as _i6;
import 'package:sensorize/services/secure_storaje_service/secure_storaje_service.dart'
    as _i7;
import 'package:sensorize/services/secure_storaje_service/secure_storaje_service_impl.dart'
    as _i8;
import 'package:sensorize/services/supabase_service/supabase_service.dart'
    as _i9;
import 'package:sensorize/services/supabase_service/supabase_service_impl.dart'
    as _i10;
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
    gh.factory<_i3.HomeProvider>(() => _i3.HomeProvider());
    gh.lazySingleton<_i4.LocalDbRepository>(() => _i4.LocalDbRepository());
    gh.singleton<_i5.NavigatorService>(() => _i6.NavigatorServiceImpl());
    gh.singleton<_i7.SecureStorajeService>(
        () => _i8.SecureStorajeServiceImpl());
    gh.singleton<_i9.SupabaseService>(
        () => _i10.SupabaseServiceImpl(gh<_i7.SecureStorajeService>()));
    gh.singleton<_i11.ToastService>(() => _i12.ToastServiceImpl());
    gh.singleton<_i13.ApiRepository>(() => _i13.ApiRepository(
          gh<_i7.SecureStorajeService>(),
          gh<_i9.SupabaseService>(),
          gh<_i11.ToastService>(),
        ));
    gh.factory<_i14.CheckAuthProvider>(() => _i14.CheckAuthProvider(
          gh<_i13.ApiRepository>(),
          gh<_i5.NavigatorService>(),
        ));
    gh.factory<_i15.LoginProvider>(() => _i15.LoginProvider(
          gh<_i13.ApiRepository>(),
          gh<_i5.NavigatorService>(),
        ));
    return this;
  }
}
