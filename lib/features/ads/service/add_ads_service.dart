import 'package:cloud_firestore/cloud_firestore.dart';

// Add product service

final class AdsService {
  static final adsDb = FirebaseFirestore.instance.collection('ads');
  static final categoryDb = FirebaseFirestore.instance.collection('category');
}
