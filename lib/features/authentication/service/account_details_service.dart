import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final class AccountDetailsService {
  static final firebaseFirestoreInstance =
      FirebaseFirestore.instance.collection('users');

  static final Reference firebaseStorageReference =
      FirebaseStorage.instance.ref().child("profileImages");
}
