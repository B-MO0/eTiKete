import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'home_widget.dart' show HomeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (drive space)] action in Home widget.
  ApiCallResponse? storagedata;
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for EventName widget.
  FocusNode? eventNameFocusNode1;
  TextEditingController? eventNameTextController1;
  String? Function(BuildContext, String?)? eventNameTextController1Validator;
  String? _eventNameTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gg4g5xcv' /* Field is required */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? eventName;
  // State field(s) for EventName widget.
  FocusNode? eventNameFocusNode2;
  TextEditingController? eventNameTextController2;
  String? Function(BuildContext, String?)? eventNameTextController2Validator;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    eventNameTextController1Validator = _eventNameTextController1Validator;
  }

  @override
  void dispose() {
    webNavModel.dispose();
    eventNameFocusNode1?.dispose();
    eventNameTextController1?.dispose();

    eventNameFocusNode2?.dispose();
    eventNameTextController2?.dispose();
  }
}
