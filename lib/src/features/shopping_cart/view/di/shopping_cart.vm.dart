
import 'package:injectable/injectable.dart';
import 'package:prototype/src/features/shopping_cart/service/di/shopping_cart.s.dart';
import 'package:prototype/src/view_model/app_routes.dart';
import 'package:prototype/src/view_model/view_model.abs.dart';
import 'package:rxdart/subjects.dart';

import '../../model/shopping_cart.st.dart';

@Injectable()
class ShoppingCartPageViewModel extends ViewModel implements ViewModelStateManagement {

  ShoppingCartPageViewModel(ShoppingCartService service) {
    _service = service;
  }

  late ShoppingCartService _service;
  
  final _stateSubject = BehaviorSubject<ShoppingCartPageState>.seeded(ShoppingCartPageState());
  Stream<ShoppingCartPageState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  Future<void> getProductList() async{
    final results = await _service.getProductList();
    updateState(
      <String, dynamic>{
        ShoppingCartFields.products : results,
      }
    );
  }

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
  }
  
  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(updateValue)
    );
  }

}