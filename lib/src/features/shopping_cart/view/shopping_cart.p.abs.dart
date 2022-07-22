import 'package:flutter/material.dart';
import 'package:prototype/src/features/shopping_cart/model/product.m.dart';


abstract class IShoppingCartPage {
  Widget buildProductItem(Product item);
}