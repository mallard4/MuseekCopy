import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UsernameLIstRecord extends FirestoreRecord {
  UsernameLIstRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "display_name" field.
  List<String>? _displayName;
  List<String> get displayName => _displayName ?? const [];
  bool hasDisplayName() => _displayName != null;

  void _initializeFields() {
    _displayName = getDataList(snapshotData['display_name']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Username_LIst');

  static Stream<UsernameLIstRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsernameLIstRecord.fromSnapshot(s));

  static Future<UsernameLIstRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsernameLIstRecord.fromSnapshot(s));

  static UsernameLIstRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsernameLIstRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsernameLIstRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsernameLIstRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsernameLIstRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsernameLIstRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsernameLIstRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class UsernameLIstRecordDocumentEquality
    implements Equality<UsernameLIstRecord> {
  const UsernameLIstRecordDocumentEquality();

  @override
  bool equals(UsernameLIstRecord? e1, UsernameLIstRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.displayName, e2?.displayName);
  }

  @override
  int hash(UsernameLIstRecord? e) =>
      const ListEquality().hash([e?.displayName]);

  @override
  bool isValidKey(Object? o) => o is UsernameLIstRecord;
}
