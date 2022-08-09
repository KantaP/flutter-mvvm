import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:prototype/src/constants/routes.dart';
import 'package:prototype/src/features/event/model/event_list.st.dart';
import 'package:prototype/src/features/event/service/di/event.s.dart';
import 'package:prototype/src/view_model/app_routes.dart';
import 'package:prototype/src/view_model/view_model.abs.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class EventListViewModel extends ViewModel {

  final EventService _eventService;
  EventListViewModel(this._eventService);

  final _stateSubject = BehaviorSubject<EventListState>.seeded(EventListState());

  Stream<EventListState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final logger = Logger("event_list_view_model");


  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
  }


  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(updateValue),
    );
  }

  void goToCreateEvent() {
    _routesSubject.add(const AppRouteSpec(name: RoutesConstant.createEvent));
  }

  void setLoading(bool loading) {
    updateState(<String, dynamic>{
        EventListFields.isLoading: loading
    });
  }

  void getEvents() async {
    try {
      setLoading(true);
      final result = await _eventService.getEvents();
      updateState(<String, dynamic>{
        EventListFields.events: result
      });
      setLoading(false);
    }catch(e) {
      logger.warning(e);
      setLoading(false);
    }
  }

}