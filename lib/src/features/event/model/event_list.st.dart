import 'package:prototype/src/features/event/model/event.m.dart';
import 'package:prototype/src/view_model/page_state.abs.dart';

class EventListState implements IPageState<EventListState> {

  List<EventModel> _events = [];
  bool _isLoading = false;
  
  EventListState({
    List<EventModel> events = const [],
    bool isLoading = false,
  }) {
    _events = events;
    _isLoading = isLoading;
  }

  List<EventModel> get events => _events;
  bool get isLoading => _isLoading;


  @override
  EventListState copyWith(Map<String, dynamic> value) {
    return EventListState(
      events: value[EventListFields.events] ?? _events,
      isLoading: value[EventListFields.isLoading] ?? _isLoading,
    );
  }
}

class EventListFields {
  EventListFields._();

  static String get events => "events";
  static String get isLoading => "isLoading";
}