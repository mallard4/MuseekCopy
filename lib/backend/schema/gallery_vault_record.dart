import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class GalleryVaultRecord extends FirestoreRecord {
  GalleryVaultRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "passcode" field.
  int? _passcode;
  int get passcode => _passcode ?? 0;
  bool hasPasscode() => _passcode != null;

  // "Date_Time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "Photo_Vault" field.
  List<String>? _photoVault;
  List<String> get photoVault => _photoVault ?? const [];
  bool hasPhotoVault() => _photoVault != null;

  // "Video_Vault" field.
  List<String>? _videoVault;
  List<String> get videoVault => _videoVault ?? const [];
  bool hasVideoVault() => _videoVault != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  void _initializeFields() {
    _passcode = castToType<int>(snapshotData['passcode']);
    _dateTime = snapshotData['Date_Time'] as DateTime?;
    _photoVault = getDataList(snapshotData['Photo_Vault']);
    _videoVault = getDataList(snapshotData['Video_Vault']);
    _uid = snapshotData['uid'] as String?;
    _displayName = snapshotData['display_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Gallery_Vault');

  static Stream<GalleryVaultRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GalleryVaultRecord.fromSnapshot(s));

  static Future<GalleryVaultRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GalleryVaultRecord.fromSnapshot(s));

  static GalleryVaultRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GalleryVaultRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GalleryVaultRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GalleryVaultRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GalleryVaultRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GalleryVaultRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGalleryVaultRecordData({
  int? passcode,
  DateTime? dateTime,
  String? uid,
  String? displayName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'passcode': passcode,
      'Date_Time': dateTime,
      'uid': uid,
      'display_name': displayName,
    }.withoutNulls,
  );

  return firestoreData;
}

class GalleryVaultRecordDocumentEquality
    implements Equality<GalleryVaultRecord> {
  const GalleryVaultRecordDocumentEquality();

  @override
  bool equals(GalleryVaultRecord? e1, GalleryVaultRecord? e2) {
    const listEquality = ListEquality();
    return e1?.passcode == e2?.passcode &&
        e1?.dateTime == e2?.dateTime &&
        listEquality.equals(e1?.photoVault, e2?.photoVault) &&
        listEquality.equals(e1?.videoVault, e2?.videoVault) &&
        e1?.uid == e2?.uid &&
        e1?.displayName == e2?.displayName;
  }

  @override
  int hash(GalleryVaultRecord? e) => const ListEquality().hash([
        e?.passcode,
        e?.dateTime,
        e?.photoVault,
        e?.videoVault,
        e?.uid,
        e?.displayName
      ]);

  @override
  bool isValidKey(Object? o) => o is GalleryVaultRecord;
}
