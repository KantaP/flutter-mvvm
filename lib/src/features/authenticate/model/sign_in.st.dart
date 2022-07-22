import 'package:prototype/src/view_model/page_state.abs.dart';

class SignInPageState implements IPageState<SignInPageState> {

  String _username = "";
  String _password = "";

  SignInPageState({
    String username = "",
    String password = "",
  }) {
    _username = username;
    _password = password;
  }

  String get username => _username;
  String get password => _password;

  @override
  SignInPageState copyWith(Map<String, dynamic> value) {
    return SignInPageState(
      username: value[SignInFields.username] ?? _username ,
      password: value[SignInFields.password] ?? _password ,
    );
  }
}

class SignInFields {
  SignInFields._();

  static const String username = "username";
  static const String password = "password";

}
