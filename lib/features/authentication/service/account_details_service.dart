import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';

final class AccountDetailsService {
  static final CollectionReference<AccountDetailsModel>
      firebaseFirestoreInstance =
      FirebaseFirestore.instance.collection('users').withConverter(
            fromFirestore: AccountDetailsModel.fromFirestore,
            toFirestore: AccountDetailsModel.toFirestore,
          );

  static final Reference firebaseStorageReference =
      FirebaseStorage.instance.ref().child("profileImages");
}
