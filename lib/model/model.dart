class ModelClass {
  late String _location;
  late String _time;
  late String _flag;
  late bool _isDay;

  ModelClass._privateConstructor();

  static final ModelClass _instance = ModelClass._privateConstructor();

  factory ModelClass() {
    return _instance;
  }

  String get location => _location;

  set location(String value) {
    _location = value;
  }

  String get time => _time;

  bool get isDay => _isDay;

  set isDay(bool value) {
    _isDay = value;
  }

  String get flag => _flag;

  set flag(String value) {
    _flag = value;
  }

  set time(String value) {
    _time = value;
  }
}
