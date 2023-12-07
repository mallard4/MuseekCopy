import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class QoutesRecord extends FirestoreRecord {
  QoutesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Qoute_Text" field.
  String? _qouteText;
  String get qouteText => _qouteText ?? '';
  bool hasQouteText() => _qouteText != null;

  // "Qoute_Photo" field.
  String? _qoutePhoto;
  String get qoutePhoto => _qoutePhoto ?? '';
  bool hasQoutePhoto() => _qoutePhoto != null;

  void _initializeFields() {
    _qouteText = snapshotData['Qoute_Text'] as String?;
    _qoutePhoto = snapshotData['Qoute_Photo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Qoutes');

  static Stream<QoutesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QoutesRecord.fromSnapshot(s));

  static Future<QoutesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QoutesRecord.fromSnapshot(s));

  static QoutesRecord fromSnapshot(DocumentSnapshot snapshot) => QoutesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QoutesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QoutesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QoutesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QoutesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQoutesRecordData({
  String? qouteText,
  String? qoutePhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Qoute_Text': qouteText,
      'Qoute_Photo': qoutePhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class QoutesRecordDocumentEquality implements Equality<QoutesRecord> {
  const QoutesRecordDocumentEquality();

  @override
  bool equals(QoutesRecord? e1, QoutesRecord? e2) {
    return e1?.qouteText == e2?.qouteText && e1?.qoutePhoto == e2?.qoutePhoto;
  }

  @override
  int hash(QoutesRecord? e) =>
      const ListEquality().hash([e?.qouteText, e?.qoutePhoto]);

  @override
  bool isValidKey(Object? o) => o is QoutesRecord;
}
