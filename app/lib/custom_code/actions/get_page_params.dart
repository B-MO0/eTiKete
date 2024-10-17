// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:html';

Future getPageParams(
  String? param1,
  String? param2,
) async {
  // null safety
  param1 ??= '';
  param2 ??= '';

  // Get the current URL
  String currentUrl = window.location.href;

  // Parse the URL
  Uri uri = Uri.parse(currentUrl);

  // Get individual parameter values
  FFAppState().authCode = uri.queryParameters[param1] ?? '';
  FFAppState().scope = uri.queryParameters[param2] ?? '';
}
