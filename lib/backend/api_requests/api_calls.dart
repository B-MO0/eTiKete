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

class CreateAppFolderCall {
  static Future<ApiCallResponse> call({
    String? accessToken = '',
    String? name = 'ETIKETE',
    String? mimeType = 'application/vnd.google-apps.folder',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "mimeType": "${mimeType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create app folder',
      apiUrl: 'https://www.googleapis.com/drive/v3/files',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CopyEventSheetNdTicketSlideCall {
  static Future<ApiCallResponse> call({
    String? fileId = '1a-uDnjomlP5FGs90Gyfiwx0Sa2SAvUxwoFJX8UWY9pE',
    String? accessToken = '',
    String? name = '',
    String? parents = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "parents": ["${parents}"]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'copy event sheet nd ticket slide ',
      apiUrl: 'https://www.googleapis.com/drive/v3/files/${fileId}/copy',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteFileFromDriveCall {
  static Future<ApiCallResponse> call({
    String? fileId = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'delete file from drive',
      apiUrl: 'https://www.googleapis.com/drive/v3/files/${fileId}',
      callType: ApiCallType.DELETE,
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

class AddTicketToSheetCall {
  static Future<ApiCallResponse> call({
    String? spreadsheetId = '',
    String? range = 'Sheet1!A:E',
    String? accessToken = '',
    String? majorDimension = 'ROWS',
    String? fName = '',
    String? lName = '',
    String? email = '',
    String? uid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "range": "${range}",
  "majorDimension": "${majorDimension}",
  "values": [
    [
      "${fName}",
      "${lName}",
      "${email}",
      "${uid}",
      "https://quickchart.io/qr?text=${uid}"
    ]
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'add ticket to sheet',
      apiUrl:
          'https://sheets.googleapis.com/v4/spreadsheets/${spreadsheetId}/values/${range}:append?valueInputOption=USER_ENTERED',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateSlideCall {
  static Future<ApiCallResponse> call({
    String? presentationId = '',
    String? accessToken = '',
    String? firstname = '',
    String? lastname = '',
    String? email = '',
    String? rectangleImageId = '',
    String? qrcode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "requests": [
    {
      "replaceAllText": {
        "containsText": {
          "text": "{{FirstName}}",
          "matchCase": true
        },
        "replaceText": "${firstname}"
      }
    },
    {
      "replaceAllText": {
        "containsText": {
          "text": "{{LastName}}",
          "matchCase": true
        },
        "replaceText": "${lastname}"
      }
    },
    {
      "replaceAllText": {
        "containsText": {
          "text": "{{Email}}",
          "matchCase": true
        },
        "replaceText": "${email}"
      }
    },
    {
      "replaceAllText": {
        "containsText": {
          "text": "{{QRcode}}",
          "matchCase": true
        },
        "replaceText": ""
      }
    },
    {
      "replaceImage": {
        "imageObjectId": "${rectangleImageId}",
        "url": "${qrcode}"
      }
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update slide',
      apiUrl:
          'https://slides.googleapis.com/v1/presentations/${presentationId}:batchUpdate',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTicketSlideDataCall {
  static Future<ApiCallResponse> call({
    String? presentationId = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get ticket slide data',
      apiUrl:
          'https://slides.googleapis.com/v1/presentations/${presentationId}',
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

class ExportFromDriveCall {
  static Future<ApiCallResponse> call({
    String? fileId = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Export from drive',
      apiUrl:
          'https://slides.googleapis.com/v1/presentations/${fileId}/pages/p/thumbnail',
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
