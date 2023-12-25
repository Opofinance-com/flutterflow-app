import 'package:flutter/material.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _webSocketData = [];
  List<String> get webSocketData => _webSocketData;
  set webSocketData(List<String> value) {
    _webSocketData = value;
  }

  void addToWebSocketData(String value) {
    _webSocketData.add(value);
  }

  void removeFromWebSocketData(String value) {
    _webSocketData.remove(value);
  }

  void removeAtIndexFromWebSocketData(int index) {
    _webSocketData.removeAt(index);
  }

  void updateWebSocketDataAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _webSocketData[index] = updateFn(_webSocketData[index]);
  }

  void insertAtIndexInWebSocketData(int index, String value) {
    _webSocketData.insert(index, value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
