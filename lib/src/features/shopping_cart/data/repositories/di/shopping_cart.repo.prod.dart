import 'package:injectable/injectable.dart';
import 'package:prototype/src/constants/api.dart';
import 'package:prototype/src/data/network/dio_client.dart';
import 'package:prototype/src/di/components/injection.dart';
import 'package:prototype/src/features/shopping_cart/data/repositories/shopping_cart.repo.dart';

@Environment(Env.production)
@Injectable(as: ShoppingCartRepository)
class ShoppingCartRepositoryProd extends ShoppingCartRepository {
  ShoppingCartRepositoryProd()
      : super(
          getIt<DioClient>(),
          ApiConstant.baseUrl,
        );
}