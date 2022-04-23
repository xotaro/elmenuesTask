// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../login_vm.dart' as _i8;
import '../../populator.dart' as _i7;
import '../../view/home/home_view_model.dart' as _i6;
import '../db/db.dart' as _i3;
import '../db/restaurant_db_provider.dart' as _i4;
import '../repository/db_repository.dart' as _i5;
import 'module.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i3.AppDatabase>(() => registerModule.database,
      preResolve: true);
  gh.factory<_i4.RestaurantDbProvider>(
      () => _i4.RestaurantDbProvider(get<_i3.AppDatabase>()));
  gh.factory<_i5.DbRepository>(
      () => _i5.DbRepository(get<_i4.RestaurantDbProvider>()));
  gh.factory<_i6.HomeViewModel>(
      () => _i6.HomeViewModel(get<_i5.DbRepository>()));
  gh.factory<_i7.Populator>(() => _i7.Populator(get<_i5.DbRepository>()));
  gh.singleton<_i8.LoginViewModel>(_i8.LoginViewModel());
  return get;
}

class _$RegisterModule extends _i9.RegisterModule {}
