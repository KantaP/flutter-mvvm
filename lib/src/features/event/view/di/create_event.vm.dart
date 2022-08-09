import 'package:injectable/injectable.dart';
import 'package:prototype/src/features/event/model/create_event.st.dart';
import 'package:prototype/src/features/event/model/event.m.dart';
import 'package:prototype/src/features/event/service/di/event.s.dart';
import 'package:prototype/src/view_model/app_routes.dart';
import 'package:prototype/src/view_model/view_model.abs.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class CreateEventViewModel extends ViewModel {

  final EventService _eventService;
  CreateEventViewModel(this._eventService);

  final _stateSubject = BehaviorSubject<CreateEventState>.seeded(CreateEventState());

  
  Stream<CreateEventState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;


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

  void setLoading(bool loading) {
    updateState(<String, dynamic> {
      CreateEventFields.isLoading : loading
    });
  }

  Future<void> createEvent() async {
    if(!_validateForm()) return;
    setLoading(true);
    final state = _stateSubject.value;
    EventModel item = EventModel(
      name: state.name,
      maximum_guest: state.maximumGuest,
    );
    final result = await _eventService.postEvent(item);
    setLoading(false);
    _routesSubject.add(const AppRouteSpec.pop());
    return;
  }

  bool _validateForm() {
    final state = _stateSubject.value;
    if(state.name.isEmpty) return false;
    if(state.maximumGuest < 1) return false; 
    return true;
  }

}