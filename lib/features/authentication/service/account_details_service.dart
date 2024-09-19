import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';

final class AccountDetailsService {
  // firestore  instance
  static final db =
      FirebaseFirestore.instance.collection('users').withConverter(
            fromFirestore: AccountDetailsModel.fromFirestore,
            toFirestore: AccountDetailsModel.toFirestore,
          );

// storage instance
  static final storage = FirebaseStorage.instance.ref().child("profileImages");

  static final user = FirebaseAuth.instance.currentUser;

// upload image to storage
  static Future<String> uploadImage({
    required File image,
  }) async {
    try {
      await storage.child(user!.phoneNumber!).putFile(image);

      return await storage.child(user!.phoneNumber!).getDownloadURL();
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  // add user data
  static Future<void> addData({
    required AccountDetailsModel accountDetails,
  }) async {
    try {
      await db.doc(user!.phoneNumber).set(accountDetails);
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  //get user data
  static Future<DocumentSnapshot<AccountDetailsModel>> getData() async {
    try {
      return await db.doc(user!.phoneNumber!).get();
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  //delete account
  static Future<void> deleteAccount() async {
    try {
      await db.doc(user!.phoneNumber!).delete();
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  //update user last seen
  static Future<void> updateLastSeen(Timestamp lastSeen) async {
    try {
      await db.doc(user!.phoneNumber!).update({
        'lastSeen': lastSeen,
      });
    } on FirebaseException catch (e) {
      throw StorageException(e.message);
    }
  }

  static Stream<DocumentSnapshot<AccountDetailsModel>> getUserDetails(
      String userId) {
    return db.doc(userId).snapshots();
  }
}
