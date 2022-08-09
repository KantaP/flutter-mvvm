import 'package:injectable/injectable.dart';
import 'package:prototype/src/features/event/data/repositories/event.repo.dart';
import 'package:prototype/src/features/event/model/event.m.dart';
import 'package:prototype/src/features/event/service/event.s.abs.dart';

@Singleton()
class EventService implements IEventService {

  late final EventRepository _repository;
  EventService(EventRepository repository) {
    _repository = repository;
  }

  @override
  Future<EventModel> postEvent(EventModel item) {
    return _repository.postEvent(item);
  }
  
  @override
  Future<List<EventModel>> getEvents() {
    return _repository.getEvents();
  }

}