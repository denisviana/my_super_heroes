// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../core/data/data_sources/super_heroes/remote/super_heroes_remote_data_source.dart'
    as _i9;
import '../core/data/data_sources/super_heroes/remote/super_heroes_remote_data_source_impl.dart'
    as _i10;
import '../core/data/helpers/secure_local_storage.dart' as _i6;
import '../core/data/network/dio_client.dart' as _i8;
import '../core/data/repositories/super_heroes/super_heroes_repository_impl.dart'
    as _i12;
import '../core/domain/repositories/super_heroes/super_heroes_repository.dart'
    as _i11;
import '../core/domain/use_cases/app/debounce_use_case.dart' as _i3;
import '../core/domain/use_cases/super_heroes/search_super_heroes_by_name_use_case.dart'
    as _i13;
import 'modules/device_module.dart' as _i16;
import 'modules/local_module.dart' as _i15;
import 'modules/remote_module.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  Future<_i1.GetIt> init(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    final remoteModule = _$RemoteModule();
    final localModule = _$LocalModule();
    final deviceModule = _$DeviceModule();
    gh.factory<_i3.DebounceUseCase>(() => _i3.DebounceUseCase());
    gh.factory<_i4.Dio>(() => remoteModule.provideDio());
    gh.singleton<_i5.FlutterSecureStorage>(localModule.storage);
    gh.singleton<_i6.SecureLocalStorage>(
        _i6.SecureLocalStorage(get<_i5.FlutterSecureStorage>()));
    await gh.factoryAsync<_i7.SharedPreferences>(() => localModule.prefs,
        preResolve: true);
    gh.factory<String>(() => deviceModule.language, instanceName: 'language');
    gh.singleton<_i4.InterceptorsWrapper>(remoteModule.provideInterceptor(
        get<_i4.Dio>(),
        get<String>(instanceName: 'language'),
        get<_i5.FlutterSecureStorage>()));
    gh.factory<_i8.DioClient>(() => remoteModule.provideApi(
        get<_i4.Dio>(), get<_i4.InterceptorsWrapper>()));
    gh.factory<_i9.SuperHeroesRemoteDataSource>(
        () => _i10.SuperHeroesRemoteDataSourceImpl(get<_i8.DioClient>()));
    gh.factory<_i11.SuperHeroesRepository>(() =>
        _i12.SuperHeroesRepositoryImpl(get<_i9.SuperHeroesRemoteDataSource>()));
    gh.factory<_i13.SearchSuperHeroesByNameUseCase>(() =>
        _i13.SearchSuperHeroesByNameUseCase(get<_i11.SuperHeroesRepository>()));
    return this;
  }
}

class _$RemoteModule extends _i14.RemoteModule {}

class _$LocalModule extends _i15.LocalModule {}

class _$DeviceModule extends _i16.DeviceModule {}
