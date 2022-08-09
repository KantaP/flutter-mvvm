import 'package:prototype/src/data/network/dio_client.dart';
import 'package:prototype/src/features/event/data/network/event.api.dart';
import 'package:prototype/src/features/event/model/event.m.dart';

class EventRepository {

  final DioClient _dioClient;
  final String _baseServicelUrl;
  late EventApiClient _apiClient;

  EventRepository(this._dioClient, this._baseServicelUrl) {
    _apiClient = EventApiClient(_dioClient, baseUrl: _baseServicelUrl);
  }

  Future<List<EventModel>> getEvents() =>
      _apiClient.getEvents();

  Future<EventModel> postEvent(EventModel item) =>
      _apiClient.postEvent(item);
}