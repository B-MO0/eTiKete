import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppinfoRecord extends FirestoreRecord {
  AppinfoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "refresh_token" field.
  String? _refreshToken;
  String get refreshToken => _refreshToken ?? '';
  bool hasRefreshToken() => _refreshToken != null;

  // "drf_id" field.
  String? _drfId;
  String get drfId => _drfId ?? '';
  bool hasDrfId() => _drfId != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _refreshToken = snapshotData['refresh_token'] as String?;
    _drfId = snapshotData['drf_id'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appinfo');

  static Stream<AppinfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppinfoRecord.fromSnapshot(s));

  static Future<AppinfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppinfoRecord.fromSnapshot(s));

  static AppinfoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppinfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppinfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppinfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppinfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppinfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppinfoRecordData({
  String? refreshToken,
  String? drfId,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'refresh_token': refreshToken,
      'drf_id': drfId,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppinfoRecordDocumentEquality implements Equality<AppinfoRecord> {
  const AppinfoRecordDocumentEquality();

  @override
  bool equals(AppinfoRecord? e1, AppinfoRecord? e2) {
    return e1?.refreshToken == e2?.refreshToken &&
        e1?.drfId == e2?.drfId &&
        e1?.user == e2?.user;
  }

  @override
  int hash(AppinfoRecord? e) =>
      const ListEquality().hash([e?.refreshToken, e?.drfId, e?.user]);

  @override
  bool isValidKey(Object? o) => o is AppinfoRecord;
}
