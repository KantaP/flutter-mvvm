import 'package:prototype/src/view_model/page_state.abs.dart';

class CreateEventState implements IPageState<CreateEventState> {
  String _name = "";
  int _maximumGuest = 0;
  bool _isLoading = false;

  CreateEventState(
      {String name = "", int maximumGuest = 0, bool isLoading = false}) {
    _name = name;
    _maximumGuest = maximumGuest;
    _isLoading = isLoading;
  }

  String get name => _name;
  int get maximumGuest => _maximumGuest;
  bool get isLoading => _isLoading;

  @override
  CreateEventState copyWith(Map<String, dynamic> value) {
    return CreateEventState(
      name: value[CreateEventFields.name] ?? _name,
      maximumGuest: (value[CreateEventFields.maximumGuest] != null)
          ? int.parse(value[CreateEventFields.maximumGuest])
          : _maximumGuest,
      isLoading: value[CreateEventFields.isLoading] ?? _isLoading,
    );
  }
}

class CreateEventFields {
  CreateEventFields._();

  static String get name => "name";
  static String get maximumGuest => "maximumGuest";
  static String get isLoading => "isLoading";
}
