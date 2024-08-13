import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/payment/domain/model/bank_account_details_model.dart';

class BankAccountDetailsService {
  static final db =
      FirebaseFirestore.instance.collection('bankAccount').withConverter(
            fromFirestore: BankAccountDetailsModel.fromFirestore,
            toFirestore: BankAccountDetailsModel.toFirestore,
          );

  static Future<void> addBankAccountDetails(
      {required BankAccountDetailsModel bankAccountDetailsModel,
      required String id}) async {
    try {
      await db.doc(id).set(bankAccountDetailsModel);
    } on FirebaseException catch (e) {
      throw BaseException(message: e.message ?? "Something went wrong");
    }
  }

  static Future<BankAccountDetailsModel?> getBankAccountDetails(
      {required String id}) async {
    try {
      final result = await db.doc(id).get();
      return result.data();
    } on FirebaseException catch (e) {
      throw BaseException(message: e.message ?? "Something went wrong");
    }
  }
}
