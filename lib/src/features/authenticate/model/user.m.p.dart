import 'package:prototype/src/features/authenticate/model/user.m.dart';
import 'package:prototype/src/model/model.abs.dart';

class UserModelPersistence implements ModelJson<UserModel> {
   
  @override
  List<UserModel> fromArrayJson(List<dynamic> arrJson) {
    return arrJson.map((e) => fromJson(e)).toList();
  }
  
  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      username: json['username'] ?? "",
      password: json['password'] ?? "",
    );
  }
  
  @override
  Map<String, dynamic> toJson(UserModel json) {
    return <String, dynamic> {
      "id" : json.id,
      "username" : json.username,
      "password" : json.password
    };
  }
}