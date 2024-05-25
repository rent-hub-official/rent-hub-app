import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';

// authentication service

final class AddAdsService {
  static final db = FirebaseFirestore.instance.collection('ads');
}
