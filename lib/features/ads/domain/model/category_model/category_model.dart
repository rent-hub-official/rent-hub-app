import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.g.dart';
part 'category_model.freezed.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    required String name,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  factory CategoryModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    var data = snapshot.data();

    data!['id'] = snapshot.id;

    return CategoryModel.fromJson(data);
  }
  static Map<String, dynamic> toFireStore(
      CategoryModel adsModel, SetOptions? options) {
    return adsModel.toJson()..remove('id');
  }
}
