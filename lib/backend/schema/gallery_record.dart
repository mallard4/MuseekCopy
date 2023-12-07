import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class GalleryRecord extends FirestoreRecord {
  GalleryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Date_Time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "Photo" field.
  List<String>? _photo;
  List<String> get photo => _photo ?? const [];
  bool hasPhoto() => _photo != null;

  // "Video" field.
  List<String>? _video;
  List<String> get video => _video ?? const [];
  bool hasVideo() => _video != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  void _initializeFields() {
    _dateTime = snapshotData['Date_Time'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
    _photo = getDataList(snapshotData['Photo']);
    _video = getDataList(snapshotData['Video']);
    _displayName = snapshotData['display_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gallery');

  static Stream<GalleryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GalleryRecord.fromSnapshot(s));

  static Future<GalleryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GalleryRecord.fromSnapshot(s));

  static GalleryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GalleryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GalleryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GalleryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GalleryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GalleryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGalleryRecordData({
  DateTime? dateTime,
  String? uid,
  String? displayName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Date_Time': dateTime,
      'uid': uid,
      'display_name': displayName,
    }.withoutNulls,
  );

  return firestoreData;
}

class GalleryRecordDocumentEquality implements Equality<GalleryRecord> {
  const GalleryRecordDocumentEquality();

  @override
  bool equals(GalleryRecord? e1, GalleryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dateTime == e2?.dateTime &&
        e1?.uid == e2?.uid &&
        listEquality.equals(e1?.photo, e2?.photo) &&
        listEquality.equals(e1?.video, e2?.video) &&
        e1?.displayName == e2?.displayName;
  }

  @override
  int hash(GalleryRecord? e) => const ListEquality()
      .hash([e?.dateTime, e?.uid, e?.photo, e?.video, e?.displayName]);

  @override
  bool isValidKey(Object? o) => o is GalleryRecord;
}
