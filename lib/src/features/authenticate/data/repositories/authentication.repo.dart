import 'package:injectable/injectable.dart';
import 'package:prototype/src/features/authenticate/data/local/di/user.ds.dart';
import 'package:prototype/src/features/authenticate/model/user.m.dart';

class AuthenticationRepository {

  final UserDataSource _userDataSource;
  AuthenticationRepository(this._userDataSource);

  Future<UserModel> insertUser(UserModel item) {
    return _userDataSource.insert(item);
  }

  Future<List<UserModel>?> getUserByFilter(Map<String , dynamic> filters) {
    return _userDataSource.getByFilter(filters);
  }
}