import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:prototype/src/features/authenticate/data/local/di/user.ds.dart';
import 'package:prototype/src/features/authenticate/data/repositories/authentication.repo.dart';
import 'package:prototype/src/features/authenticate/model/create_account.st.dart';
import 'package:prototype/src/features/authenticate/model/user.m.dart';
import 'package:prototype/src/view_model/app_routes.dart';
import 'package:prototype/src/view_model/view_model.abs.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class CreateAccountViewModel extends ViewModel {

  final AuthenticationRepository _repository;
  CreateAccountViewModel(this._repository);

  final _stateSubject =
      BehaviorSubject<CreateAccountState>.seeded(CreateAccountState());
  Stream<CreateAccountState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  
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

  void goBack() {
    _routesSubject.add(const AppRouteSpec.pop());
  }

  Future<void> createUser(BuildContext context) async {
    
    if(!_validateForm()) return;


    final state = _stateSubject.value;
    final result = _repository.insertUser(UserModel(username: state.username, password: state.password));
    final snackBar = SnackBar(content: Text("User created"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Future.delayed(const Duration(milliseconds: 500) ,() {
      _routesSubject.add(const AppRouteSpec.pop());
    });
    return;
  }

  bool _validateForm() {
    final state = _stateSubject.value;
    if(state.password == "") return false;
    if(state.confirmPassword == "") return false;
    if(state.password != state.confirmPassword) return false; 
    if(state.acceptTerm == false) return false;
    return true;
  }

}