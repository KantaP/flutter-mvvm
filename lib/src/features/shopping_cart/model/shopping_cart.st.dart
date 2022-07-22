import 'package:prototype/src/features/shopping_cart/model/product.m.dart';
import 'package:prototype/src/view_model/page_state.abs.dart';

class ShoppingCartPageState implements IPageState<ShoppingCartPageState> {

  List<Product> _products = [];

  ShoppingCartPageState({
    List<Product> products = const []
  }) {
    _products = products;
  }

  List<Product> get products => _products;
  
  @override
  ShoppingCartPageState copyWith(Map<String, dynamic> value) {
    return ShoppingCartPageState(
      products: value[ShoppingCartFields.products] ?? _products
    );
  }
}

class ShoppingCartFields { 
  ShoppingCartFields._();

  static const String products = "products";
}