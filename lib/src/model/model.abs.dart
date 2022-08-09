abstract class ModelJson<T> {
  List<T> fromArrayJson(List<dynamic> arrJson);
  T fromJson(Map<String, dynamic> json);
  Map<String , dynamic> toJson(T json);
}

abstract class ModelMap<T> {
  T fromMap(Map<String, dynamic> json);
  Map<String , dynamic> toMap(T json);
}
