// ignore_for_file: depend_on_referenced_packages

import 'package:stripe_payment/stripe_payment.dart';

class StripeService {
  static String apiKey = 'your_stripe_api_key';

  static void init() {
    StripePayment.setOptions(
      StripeOptions(
        publishableKey: apiKey,
        merchantId: "Test",
        androidPayMode: 'test',
      ),
    );
  }

  static Future<void> processPayment(double amount) async {
    try {
      var paymentMethod = await StripePayment.paymentRequestWithCardForm(
        CardFormPaymentRequest(),
      );
      print('Payment successful: ${paymentMethod.id}');
      // Call your backend to process payment using the token
    } catch (err) {
      print('Payment failed: $err');
    }
  }
}
