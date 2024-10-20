import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DriveRecord extends FirestoreRecord {
  DriveRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "usage" field.
  String? _usage;
  String get usage => _usage ?? '';
  bool hasUsage() => _usage != null;

  // "limit" field.
  String? _limit;
  String get limit => _limit ?? '';
  bool hasLimit() => _limit != null;

  // "rft" field.
  String? _rft;
  String get rft => _rft ?? '';
  bool hasRft() => _rft != null;

  void _initializeFields() {
    _usage = snapshotData['usage'] as String?;
    _limit = snapshotData['limit'] as String?;
    _rft = snapshotData['rft'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Drive');

  static Stream<DriveRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DriveRecord.fromSnapshot(s));

  static Future<DriveRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DriveRecord.fromSnapshot(s));

  static DriveRecord fromSnapshot(DocumentSnapshot snapshot) => DriveRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DriveRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DriveRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DriveRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DriveRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDriveRecordData({
  String? usage,
  String? limit,
  String? rft,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usage': usage,
      'limit': limit,
      'rft': rft,
    }.withoutNulls,
  );

  return firestoreData;
}

class DriveRecordDocumentEquality implements Equality<DriveRecord> {
  const DriveRecordDocumentEquality();

  @override
  bool equals(DriveRecord? e1, DriveRecord? e2) {
    return e1?.usage == e2?.usage &&
        e1?.limit == e2?.limit &&
        e1?.rft == e2?.rft;
  }

  @override
  int hash(DriveRecord? e) =>
      const ListEquality().hash([e?.usage, e?.limit, e?.rft]);

  @override
  bool isValidKey(Object? o) => o is DriveRecord;
}
