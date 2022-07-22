import 'package:prototype/src/constants/routes.dart';
import 'package:prototype/src/view_model/app_routes.dart';
import 'package:prototype/src/view_model/view_model.abs.dart';
import 'package:rxdart/rxdart.dart';

import '../model/sign_in.st.dart';

class SignInPageViewModel extends ViewModel
    implements ViewModelStateManagement {

  final _stateSubject =
      BehaviorSubject<SignInPageState>.seeded(SignInPageState());
  Stream<SignInPageState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  void updateUsername(String username) {
    updateState(<String, dynamic>{SignInFields.username: username});
  }

  void updatePassword(String password) {
    updateState(<String, dynamic>{SignInFields.password: password});
  }

  void signIn() {
    _routesSubject.add(const AppRouteSpec(name: RoutesConstant.shoppingCart));
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
      state.copyWith(updateValue),
    );
  }
}
