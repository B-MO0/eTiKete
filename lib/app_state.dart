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
      _limit = prefs.getString('ff_limit') ?? _limit;
    });
    _safeInit(() {
      _usage = prefs.getString('ff_usage') ?? _usage;
    });
    _safeInit(() {
      _FreeSpace = prefs.getString('ff_FreeSpace') ?? _FreeSpace;
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

  String _limit = '';
  String get limit => _limit;
  set limit(String value) {
    _limit = value;
    prefs.setString('ff_limit', value);
  }

  String _usage = '';
  String get usage => _usage;
  set usage(String value) {
    _usage = value;
    prefs.setString('ff_usage', value);
  }

  String _FreeSpace = '';
  String get FreeSpace => _FreeSpace;
  set FreeSpace(String value) {
    _FreeSpace = value;
    prefs.setString('ff_FreeSpace', value);
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
