import 'package:prototype/src/model/model.abs.dart';

class UserModel{
  int? id;
  String username;
  String password;
  
  UserModel({this.id , required this.username, required this.password});

}