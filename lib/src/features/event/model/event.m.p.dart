import 'package:prototype/src/features/event/model/event.m.dart';
import 'package:prototype/src/model/model.abs.dart';

class EventModelPersistence implements ModelJson<EventModel> {   
  @override
  List<EventModel> fromArrayJson(List<dynamic> arrJson) {
    return arrJson.map((e) => fromJson(e)).toList();
  }

  @override
  EventModel fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      maximum_guest: json['maximum_guest'] ?? 0
    );
  }

  @override
  Map<String, dynamic> toJson(EventModel json) {
    return <String, dynamic> {
      "id" : json.id,
      "name" : json.name,
      "maximum_guest" : json.maximum_guest
    };
  }
}
