// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/network/dio_client.dart' as _i4;
import '../../features/authenticate/data/local/di/user.ds.dart' as _i15;
import '../../features/authenticate/data/repositories/authentication.repo.dart'
    as _i16;
import '../../features/authenticate/data/repositories/di/authentication.repo.dev.dart'
    as _i19;
import '../../features/authenticate/data/repositories/di/authentication.repo.prod.dart'
    as _i18;
import '../../features/authenticate/data/repositories/di/authentication.repo.stag.dart'
    as _i17;
import '../../features/authenticate/view/di/create_account.vm.dart' as _i20;
import '../../features/authenticate/view/di/sign_in.vm.dart' as _i24;
import '../../features/event/data/repositories/di/event.repo.dev.dart' as _i6;
import '../../features/event/data/repositories/di/event.repo.prod.dart' as _i7;
import '../../features/event/data/repositories/di/event.repo.stag.dart' as _i8;
import '../../features/event/data/repositories/event.repo.dart' as _i5;
import '../../features/event/service/di/event.s.dart' as _i9;
import '../../features/event/view/di/create_event.vm.dart' as _i21;
import '../../features/event/view/di/event_list.vm.dart' as _i22;
import '../../features/shopping_cart/data/repositories/di/shopping_cart.repo.dev.dart'
    as _i13;
import '../../features/shopping_cart/data/repositories/di/shopping_cart.repo.prod.dart'
    as _i11;
import '../../features/shopping_cart/data/repositories/di/shopping_cart.repo.stag.dart'
    as _i12;
import '../../features/shopping_cart/data/repositories/shopping_cart.repo.dart'
    as _i10;
import '../../features/shopping_cart/service/di/shopping_cart.s.dart' as _i14;
import '../../features/shopping_cart/view/di/shopping_cart.vm.dart' as _i23;
import '../modules/network_module.dart' as _i25;

const String _development = 'development';
const String _production = 'production';
const String _stagging = 'stagging';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.factory<_i3.Dio>(() => networkModule.provideDio());
  gh.singleton<_i4.DioClient>(_i4.DioClient(get<_i3.Dio>()));
  gh.factory<_i5.EventRepository>(() => _i6.EventRepositoryDev(),
      registerFor: {_development});
  gh.factory<_i5.EventRepository>(() => _i7.EventRepositoryProd(),
      registerFor: {_production});
  gh.factory<_i5.EventRepository>(() => _i8.EventRepositoryStag(),
      registerFor: {_stagging});
  gh.singleton<_i9.EventService>(_i9.EventService(get<_i5.EventRepository>()));
  gh.factory<_i10.ShoppingCartRepository>(
      () => _i11.ShoppingCartRepositoryProd(),
      registerFor: {_production});
  gh.factory<_i10.ShoppingCartRepository>(
      () => _i12.ShoppingCartRepositoryStag(),
      registerFor: {_stagging});
  gh.factory<_i10.ShoppingCartRepository>(
      () => _i13.ShoppingCartRepositoryDev(),
      registerFor: {_development});
  gh.factory<_i14.ShoppingCartService>(
      () => _i14.ShoppingCartService(get<_i10.ShoppingCartRepository>()));
  gh.singleton<_i15.UserDataSource>(_i15.UserDataSource());
  gh.factory<_i16.AuthenticationRepository>(
      () => _i17.AuthenticationRepositoryStag(get<_i15.UserDataSource>()),
      registerFor: {_stagging});
  gh.factory<_i16.AuthenticationRepository>(
      () => _i18.AuthenticationRepositoryProd(get<_i15.UserDataSource>()),
      registerFor: {_production});
  gh.factory<_i16.AuthenticationRepository>(
      () => _i19.AuthenticationRepositoryDev(get<_i15.UserDataSource>()),
      registerFor: {_development});
  gh.factory<_i20.CreateAccountViewModel>(
      () => _i20.CreateAccountViewModel(get<_i16.AuthenticationRepository>()));
  gh.factory<_i21.CreateEventViewModel>(
      () => _i21.CreateEventViewModel(get<_i9.EventService>()));
  gh.factory<_i22.EventListViewModel>(
      () => _i22.EventListViewModel(get<_i9.EventService>()));
  gh.factory<_i23.ShoppingCartPageViewModel>(
      () => _i23.ShoppingCartPageViewModel(get<_i14.ShoppingCartService>()));
  gh.factory<_i24.SignInPageViewModel>(
      () => _i24.SignInPageViewModel(get<_i16.AuthenticationRepository>()));
  return get;
}

class _$NetworkModule extends _i25.NetworkModule {}
