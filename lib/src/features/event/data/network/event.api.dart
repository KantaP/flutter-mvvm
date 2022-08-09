

import 'package:dio/dio.dart';
import 'package:prototype/src/constants/api.dart';
import 'package:prototype/src/data/network/api_client.dart';
import 'package:prototype/src/features/event/data/network/event.api.abs.dart';
import 'package:prototype/src/features/event/model/event.m.dart';
import 'package:prototype/src/features/event/model/event.m.p.dart';

class EventApiClient extends ApiClient implements IEventApiClient {

  EventApiClient(super.dioClient , {super.baseUrl});
  
  @override
  Future<List<EventModel>> getEvents() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'Content-Type': 'application/json'};
    headers.removeWhere((k, v) => v == null);
    final List<dynamic> result = await dioClient.get(
      "$baseUrl${ApiConstant.pathEvents}",
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        extra: extra,
        contentType: 'application/json'
      )
    );
    final value = EventModelPersistence().fromArrayJson(
      result
    );
    return value;
  }
  
  @override
  Future<EventModel> postEvent(EventModel item) async {
    final headers = <String, dynamic>{r'Content-Type': 'application/json'};
    headers.removeWhere((k, v) => v == null);
    final dynamic result = await dioClient.post(
      "$baseUrl${ApiConstant.pathEvents}",
      data: EventModelPersistence().toJson(item),
      options: Options(
        headers: headers,
        contentType: 'application/json'
      )
    );
    final value = EventModelPersistence().fromJson(
      result
    );
    return value;
  }


  


}