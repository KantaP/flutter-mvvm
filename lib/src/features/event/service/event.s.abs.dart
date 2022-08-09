import 'package:prototype/src/features/event/model/event.m.dart';

abstract class IEventService {
  Future<EventModel> postEvent(EventModel item);
  Future<List<EventModel>> getEvents();
}