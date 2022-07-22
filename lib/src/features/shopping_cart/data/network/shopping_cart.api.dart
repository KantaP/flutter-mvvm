

import 'package:dio/dio.dart';
import 'package:prototype/src/constants/api.dart';
import 'package:prototype/src/data/network/api_client.dart';
import 'package:prototype/src/features/shopping_cart/data/network/shopping_cart.api.abs.dart';
import 'package:prototype/src/features/shopping_cart/model/product.m.dart';
import 'package:prototype/src/features/shopping_cart/model/product.m.p.dart';

class ShoppingCartApiClient extends ApiClient implements IShoppingCartApiClient {

  ShoppingCartApiClient(super.dioClient , {super.baseUrl});

  @override
  Future<List<Product>> getProducts() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'Content-Type': 'application/json'};
    headers.removeWhere((k, v) => v == null);
    final List<dynamic> result = await dioClient.get(
      "$baseUrl${ApiConstant.pathProducts}",
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        extra: extra,
        contentType: 'application/json'
      )
    );
    final value = ProductModelPersistence().fromArrayJson(
      result
    );
    return value;
  }


}