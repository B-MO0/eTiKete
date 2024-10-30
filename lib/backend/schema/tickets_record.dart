import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TicketsRecord extends FirestoreRecord {
  TicketsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "range" field.
  String? _range;
  String get range => _range ?? '';
  bool hasRange() => _range != null;

  // "eref" field.
  DocumentReference? _eref;
  DocumentReference? get eref => _eref;
  bool hasEref() => _eref != null;

  // "qrlink" field.
  String? _qrlink;
  String get qrlink => _qrlink ?? '';
  bool hasQrlink() => _qrlink != null;

  // "tkurl" field.
  String? _tkurl;
  String get tkurl => _tkurl ?? '';
  bool hasTkurl() => _tkurl != null;

  // "sid" field.
  String? _sid;
  String get sid => _sid ?? '';
  bool hasSid() => _sid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _email = snapshotData['email'] as String?;
    _uid = snapshotData['uid'] as String?;
    _range = snapshotData['range'] as String?;
    _eref = snapshotData['eref'] as DocumentReference?;
    _qrlink = snapshotData['qrlink'] as String?;
    _tkurl = snapshotData['tkurl'] as String?;
    _sid = snapshotData['sid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tickets')
          : FirebaseFirestore.instance.collectionGroup('tickets');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tickets').doc(id);

  static Stream<TicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TicketsRecord.fromSnapshot(s));

  static Future<TicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TicketsRecord.fromSnapshot(s));

  static TicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TicketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TicketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTicketsRecordData({
  String? firstName,
  String? lastName,
  String? email,
  String? uid,
  String? range,
  DocumentReference? eref,
  String? qrlink,
  String? tkurl,
  String? sid,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'uid': uid,
      'range': range,
      'eref': eref,
      'qrlink': qrlink,
      'tkurl': tkurl,
      'sid': sid,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class TicketsRecordDocumentEquality implements Equality<TicketsRecord> {
  const TicketsRecordDocumentEquality();

  @override
  bool equals(TicketsRecord? e1, TicketsRecord? e2) {
    return e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.email == e2?.email &&
        e1?.uid == e2?.uid &&
        e1?.range == e2?.range &&
        e1?.eref == e2?.eref &&
        e1?.qrlink == e2?.qrlink &&
        e1?.tkurl == e2?.tkurl &&
        e1?.sid == e2?.sid &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(TicketsRecord? e) => const ListEquality().hash([
        e?.firstName,
        e?.lastName,
        e?.email,
        e?.uid,
        e?.range,
        e?.eref,
        e?.qrlink,
        e?.tkurl,
        e?.sid,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is TicketsRecord;
}
