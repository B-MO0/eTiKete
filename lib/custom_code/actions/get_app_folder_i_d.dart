// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:html';

Future getAppFolderID(
  BuildContext context,
  String parameter2,
) async {
  // Get the current user
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) return;

  try {
    // Query the appinfo collection for document with matching user reference
    final querySnapshot = await FirebaseFirestore.instance
        .collection('appinfo')
        .where('user',
            isEqualTo:
                FirebaseFirestore.instance.doc('users/${currentUser.uid}'))
        .limit(1)
        .get();

    // Check if we found a matching document
    if (querySnapshot.docs.isEmpty) {
      return;
    }

    final appFolderId = querySnapshot.docs.first.get('drf_id') as String?;
    if (appFolderId == null) {
      return;
    }

    FFAppState().update(() {
      FFAppState().drfId = appFolderId;
    });
  } catch (e) {
    print('Error getting id: $e');
  }
}
