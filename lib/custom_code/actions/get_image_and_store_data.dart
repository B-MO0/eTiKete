// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';

Future getImageAndStoreData(
  BuildContext context,
  String imageUrl,
) async {
  try {
    // Make HTTP GET request to fetch the image
    final response = await http.get(Uri.parse(imageUrl));

    // Check if the request was successful
    if (response.statusCode == 200) {
      // Get the image data as bytes
      final Uint8List imageBytes = response.bodyBytes;

      // Convert the bytes to base64 string for storage
      final String base64String = base64Encode(imageBytes);

      // Store the base64 string in FFAppState
      FFAppState().update(() {
        FFAppState().ticketdata = base64String;
      });

      print('Image data successfully stored in app state');
    } else {
      print('Failed to fetch image: ${response.statusCode}');
    }
  } catch (e) {
    print('Error processing image: $e');
  }
}
