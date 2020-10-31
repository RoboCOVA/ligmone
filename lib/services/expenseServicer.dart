import 'package:flutter/cupertino.dart';
import 'package:ligmone/services/financeDatabase.dart';
import 'package:ligmone/wallet/models/payment_model.dart';

class ExpenseServicer extends ChangeNotifier {
  // FinanceDatabase _finaceServices = FinanceDatabase();
  PaymentModel payment;
  ExpenseServicer.initialize() {
    loadProducts();
  }

  loadProducts() async {
    //await _finaceServices.sendExpense(payment);

    notifyListeners();
  }
}
