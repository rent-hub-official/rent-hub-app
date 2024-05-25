import 'package:cloud_firestore/cloud_firestore.dart';

// Add product service

final class AddAdsService {
  static final db = FirebaseFirestore.instance.collection('ads');
}
