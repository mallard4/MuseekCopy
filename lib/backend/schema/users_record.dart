import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "password_confirmed" field.
  String? _passwordConfirmed;
  String get passwordConfirmed => _passwordConfirmed ?? '';
  bool hasPasswordConfirmed() => _passwordConfirmed != null;

  // "First_Name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "Last_Name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "Profile_Photo" field.
  String? _profilePhoto;
  String get profilePhoto => _profilePhoto ?? '';
  bool hasProfilePhoto() => _profilePhoto != null;

  // "Blocked_Users" field.
  List<String>? _blockedUsers;
  List<String> get blockedUsers => _blockedUsers ?? const [];
  bool hasBlockedUsers() => _blockedUsers != null;

  // "Friends_List" field.
  List<String>? _friendsList;
  List<String> get friendsList => _friendsList ?? const [];
  bool hasFriendsList() => _friendsList != null;

  // "Background_Photo" field.
  String? _backgroundPhoto;
  String get backgroundPhoto => _backgroundPhoto ?? '';
  bool hasBackgroundPhoto() => _backgroundPhoto != null;

  // "Date_OF_Birth" field.
  int? _dateOFBirth;
  int get dateOFBirth => _dateOFBirth ?? 0;
  bool hasDateOFBirth() => _dateOFBirth != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _password = snapshotData['password'] as String?;
    _passwordConfirmed = snapshotData['password_confirmed'] as String?;
    _firstName = snapshotData['First_Name'] as String?;
    _lastName = snapshotData['Last_Name'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _email = snapshotData['email'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _profilePhoto = snapshotData['Profile_Photo'] as String?;
    _blockedUsers = getDataList(snapshotData['Blocked_Users']);
    _friendsList = getDataList(snapshotData['Friends_List']);
    _backgroundPhoto = snapshotData['Background_Photo'] as String?;
    _dateOFBirth = castToType<int>(snapshotData['Date_OF_Birth']);
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  DateTime? createdTime,
  String? password,
  String? passwordConfirmed,
  String? firstName,
  String? lastName,
  String? displayName,
  String? email,
  String? phoneNumber,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? profilePhoto,
  String? backgroundPhoto,
  int? dateOFBirth,
  String? photoUrl,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'password': password,
      'password_confirmed': passwordConfirmed,
      'First_Name': firstName,
      'Last_Name': lastName,
      'display_name': displayName,
      'email': email,
      'phone_number': phoneNumber,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'Profile_Photo': profilePhoto,
      'Background_Photo': backgroundPhoto,
      'Date_OF_Birth': dateOFBirth,
      'photo_url': photoUrl,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.password == e2?.password &&
        e1?.passwordConfirmed == e2?.passwordConfirmed &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.displayName == e2?.displayName &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.profilePhoto == e2?.profilePhoto &&
        listEquality.equals(e1?.blockedUsers, e2?.blockedUsers) &&
        listEquality.equals(e1?.friendsList, e2?.friendsList) &&
        e1?.backgroundPhoto == e2?.backgroundPhoto &&
        e1?.dateOFBirth == e2?.dateOFBirth &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.password,
        e?.passwordConfirmed,
        e?.firstName,
        e?.lastName,
        e?.displayName,
        e?.email,
        e?.phoneNumber,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.profilePhoto,
        e?.blockedUsers,
        e?.friendsList,
        e?.backgroundPhoto,
        e?.dateOFBirth,
        e?.photoUrl,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
