import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _authCode = prefs.getString('ff_authCode') ?? _authCode;
    });
    _safeInit(() {
      _AccessToken = prefs.getString('ff_AccessToken') ?? _AccessToken;
    });
    _safeInit(() {
      _RefreshToken = prefs.getString('ff_RefreshToken') ?? _RefreshToken;
    });
    _safeInit(() {
      _limit = prefs.getDouble('ff_limit') ?? _limit;
    });
    _safeInit(() {
      _usage = prefs.getDouble('ff_usage') ?? _usage;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _authCode = '';
  String get authCode => _authCode;
  set authCode(String value) {
    _authCode = value;
    prefs.setString('ff_authCode', value);
  }

  String _scope = '';
  String get scope => _scope;
  set scope(String value) {
    _scope = value;
  }

  String _AccessToken = '';
  String get AccessToken => _AccessToken;
  set AccessToken(String value) {
    _AccessToken = value;
    prefs.setString('ff_AccessToken', value);
  }

  String _RefreshToken = '';
  String get RefreshToken => _RefreshToken;
  set RefreshToken(String value) {
    _RefreshToken = value;
    prefs.setString('ff_RefreshToken', value);
  }

  double _limit = 0.0;
  double get limit => _limit;
  set limit(double value) {
    _limit = value;
    prefs.setDouble('ff_limit', value);
  }

  double _usage = 0.0;
  double get usage => _usage;
  set usage(double value) {
    _usage = value;
    prefs.setDouble('ff_usage', value);
  }

  double _freeSpace = 0.0;
  double get freeSpace => _freeSpace;
  set freeSpace(double value) {
    _freeSpace = value;
  }
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
