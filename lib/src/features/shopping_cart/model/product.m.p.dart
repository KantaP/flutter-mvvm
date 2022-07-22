import 'package:prototype/src/model/model.abs.dart';

import 'product.m.dart';

class ProductModelPersistence implements ModelJson<Product> {

  ProductModelPersistence();

  @override
  Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      price: json['price'] ?? "",
      description: json['description'] ?? "",
      image:  json['image'] ?? "",
    );
  }

  @override
  Map<String, dynamic> toJson(Product json) {
    return <String, dynamic> {
      "id" : json.id,
      "name" : json.name,
      "price" : json.price,
      "description" : json.description,
      "image" : json.image
    };
  }
  
  @override
  List<Product> fromArrayJson(List<dynamic> arrJson) {
    return arrJson.map((e) => fromJson(e)).toList();
  }

}