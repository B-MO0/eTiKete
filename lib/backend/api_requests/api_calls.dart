import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetAccessTokenAndRefreshTokenCall {
  static Future<ApiCallResponse> call({
    String? authCode = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Access token and Refresh token',
      apiUrl: 'https://oauth2.googleapis.com/token',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'code': authCode,
        'client_id':
            "364818987476-v8lv59fnr7qjo4s55e0ngr86idmigqdi.apps.googleusercontent.com",
        'client_secret': "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",
        'redirect_uri': "https://etikete-7k15uq.flutterflow.app",
        'grant_type': "authorization_code",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DriveSpaceCall {
  static Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'drive space',
      apiUrl: 'https://www.googleapis.com/drive/v3/about?fields=storageQuota',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAccessTokenFromRefreshTokenCall {
  static Future<ApiCallResponse> call({
    String? refreshToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get access token from refresh token',
      apiUrl: 'https://oauth2.googleapis.com/token',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'client_id':
            "364818987476-v8lv59fnr7qjo4s55e0ngr86idmigqdi.apps.googleusercontent.com",
        'client_secret': "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",
        'grant_type': "refresh_token",
        'refresh_token': refreshToken,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
