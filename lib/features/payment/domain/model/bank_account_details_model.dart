
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'bank_account_details_model.freezed.dart';
part 'bank_account_details_model.g.dart';

@freezed
class BankAccountDetailsModel with _$BankAccountDetailsModel {

  const factory BankAccountDetailsModel({
    required String accountNumber,  
    required String confirmAccountNumber,  
    required String bankName,  
    required String ifscCode,  
    
        })=_BankAccountDetailsModel;



          factory BankAccountDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$BankAccountDetailsModelFromJson(json);

  factory BankAccountDetailsModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    return BankAccountDetailsModel.fromJson(snapshot.data()!);
  }


}