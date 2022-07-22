// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/network/dio_client.dart' as _i4;
import '../../features/shopping_cart/data/di/shopping_cart.repo.dev.dart'
    as _i8;
import '../../features/shopping_cart/data/di/shopping_cart.repo.prod.dart'
    as _i6;
import '../../features/shopping_cart/data/di/shopping_cart.repo.stag.dart'
    as _i7;
import '../../features/shopping_cart/data/repositories/shopping_cart.repo.dart'
    as _i5;
import '../../features/shopping_cart/service/di/shopping_cart.s.dart' as _i9;
import '../../features/shopping_cart/view/di/shopping_cart.vm.dart' as _i10;
import '../modules/network_module.dart' as _i11;

const String _production = 'production';
const String _stagging = 'stagging';
const String _development = 'development';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.factory<_i3.Dio>(() => networkModule.provideDio());
  gh.singleton<_i4.DioClient>(_i4.DioClient(get<_i3.Dio>()));
  gh.factory<_i5.ShoppingCartRepository>(() => _i6.ShoppingCartRepositoryProd(),
      registerFor: {_production});
  gh.factory<_i5.ShoppingCartRepository>(() => _i7.ShoppingCartRepositoryStag(),
      registerFor: {_stagging});
  gh.factory<_i5.ShoppingCartRepository>(() => _i8.ShoppingCartRepositoryDev(),
      registerFor: {_development});
  gh.factory<_i9.ShoppingCartService>(
      () => _i9.ShoppingCartService(get<_i5.ShoppingCartRepository>()));
  gh.factory<_i10.ShoppingCartPageViewModel>(
      () => _i10.ShoppingCartPageViewModel(get<_i9.ShoppingCartService>()));
  return get;
}

class _$NetworkModule extends _i11.NetworkModule {}
