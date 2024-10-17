// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> freeDriveSpace(
  double limit,
  double usage,
) async {
  // Ensure limit is not zero to avoid division by zero
  if (limit <= 0) {
    FFAppState().freeSpace = 0;
    return;
  }

  // Calculate free space in bytes
  double freeSpaceBytes = limit - usage;

  // Calculate percentage of free space
  double freeSpacePercentage = (freeSpaceBytes / limit) * 100;

  // Round to two decimal places
  double roundedFreeSpace =
      double.parse(freeSpacePercentage.toStringAsFixed(2));

  // Store the result in FFAppState().freeSpace
  FFAppState().freeSpace = roundedFreeSpace;
}
