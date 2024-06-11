import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

// Add product service

final class AdsService {
  static final adsDb = FirebaseFirestore.instance.collection('ads');

  static final adsStorage = FirebaseStorage.instance.ref().child('adsImages');

  static final categoryDb = FirebaseFirestore.instance.collection('category');
}
