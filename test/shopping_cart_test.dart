import 'package:prototype/src/constants/api.dart';
import 'package:prototype/src/data/network/dio_client.dart';
import 'package:prototype/src/di/components/injection.dart';
import 'package:prototype/src/features/shopping_cart/data/repositories/shopping_cart.repo.dart';
import 'package:prototype/src/features/shopping_cart/view/di/shopping_cart.vm.dart';

import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'package:test/test.dart';

void main() {

  late ShoppingCartPageViewModel viewModel;
  late Dio dio;
  late DioAdapter dioAdapter;
  late ShoppingCartRepository repository;

  setUpAll(() {
    configureInjection(Env.development);
  });

  group('ShippingCart View Model', () {
    setUp(() {
      viewModel = getIt<ShoppingCartPageViewModel>();
    });
     test('initial state starts', () async {
      final state = await viewModel.state.first;
      expect(state.products, []);
    });
    test('get product list', () async {
      await viewModel.getProductList();
      
      final state = await viewModel.state.first;
      expect(state.products.length, greaterThan(0));
    });
  });

  group('ShippingCart api call' , () {
    setUp(() {
      dio = Dio();
      dioAdapter = DioAdapter(dio: dio);
      dio.httpClientAdapter = dioAdapter;
      repository = ShoppingCartRepository(getIt<DioClient>() , ApiConstant.baseUrl);

      dioAdapter
      ..onGet(ApiConstant.pathProducts, (server) { });

    });

    test('dio get' , () {

    });
    
  }); 
}