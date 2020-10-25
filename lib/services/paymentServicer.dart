import 'package:flutter/cupertino.dart';
import 'package:ligmone/services/financeDatabase.dart';
import 'package:ligmone/wallet/models/payment_model.dart';

class PaymentServicer extends ChangeNotifier {
  FinanceDatabase _paymentServices = FinanceDatabase();

  List<PaymentModel> paymentHistory = [];
  PaymentServicer.initialize() {
    loadProducts();
  }

  loadProducts() async {
    paymentHistory = await _paymentServices.getPayment();
    notifyListeners();
  }
}
