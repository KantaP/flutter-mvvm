import 'package:injectable/injectable.dart';
import 'package:prototype/src/features/shopping_cart/data/repositories/shopping_cart.repo.dart';
import 'package:prototype/src/features/shopping_cart/model/product.m.dart';
import 'package:prototype/src/features/shopping_cart/service/shopping_cart.s.abs.dart';

@Injectable()
class ShoppingCartService implements IShoppingCartService{

  late final ShoppingCartRepository _repository;
  
  ShoppingCartService(ShoppingCartRepository repository) {
    _repository = repository;
  }

  @override
  Future<List<Product>> getProductList() async {
    return _repository.getProducts();
  }
}


