import 'package:dio/dio.dart';
import 'package:prototype/src/data/network/dio_client.dart';
import 'package:prototype/src/features/shopping_cart/data/network/shopping_cart.api.dart';
import 'package:prototype/src/features/shopping_cart/model/product.m.dart';

class ShoppingCartRepository {

  final DioClient _dioClient;
  final String _baseServicelUrl;
  late ShoppingCartApiClient _apiClient;

  ShoppingCartRepository(this._dioClient, this._baseServicelUrl) {
    _apiClient = ShoppingCartApiClient(_dioClient, baseUrl: _baseServicelUrl);
  }

  Future<List<Product>> getProducts() =>
      _apiClient.getProducts();
}