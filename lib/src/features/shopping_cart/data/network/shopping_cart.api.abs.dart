import 'package:prototype/src/features/shopping_cart/model/product.m.dart';

abstract class IShoppingCartApiClient {
  Future<List<Product>> getProducts();
}