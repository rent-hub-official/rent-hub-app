import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rent_hub/core/secret_keys.dart';
import 'package:uuid/uuid.dart';

class PaymentService {
  final Razorpay _razorpay = Razorpay();

  late String _uuid;

  PaymentService() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future<dynamic> createOrder(int amount) async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.razorpay.com'));

    _uuid = const Uuid().v4();

    try {
      final response = await dio.post(
        '/v1/orders',
        options: Options(
          contentType: 'application/json',
          headers: {
            'Authorization': 'Basic ${base64.encode(
              utf8.encode(
                '${SecretKeys.razorpayKey}:${SecretKeys.razorpaySecret}',
              ),
            )}',
          },
        ),
        data: jsonEncode({
          "amount": (100 * amount),
          "currency": "INR",
          "receipt": _uuid,
        }),
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to create order');
    }
  }

  void doPayment(int amount) async {
    final orderData = await createOrder(amount);

    var options = {
      'key': '${SecretKeys.razorpayKey}',
      'amount': orderData['amount'],
      'name': 'RentHub',
      'order_id': '${orderData['id']}',
      'description': 'Payment for RentHub',
      'timeout': 60 * 2,
    };

    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    final keySecret = utf8.encode('${SecretKeys.razorpaySecret}');

    final bytes = utf8.encode('${response.orderId}|${response.paymentId}');

    final hmacSha256 = Hmac(sha256, keySecret);

    final generatedSignature = hmacSha256.convert(bytes);

    if (generatedSignature.toString() == response.signature) {
      print("Payment was successful!");
      
    } else {
      print("The payment was fake!");
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment error: ${response.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('${response.walletName} opened');
  }

  void dispose() {
    _razorpay.clear();
  }
}
