import 'package:flutter/cupertino.dart';
import 'package:ligmone/services/financeDatabase.dart';
import 'package:ligmone/wallet/models/credit_card_model.dart';

class FinanceServicer extends ChangeNotifier {
  FinanceDatabase _finaceServices = FinanceDatabase();
  List<CreditCardModel> creditCards = [];

  FinanceServicer.initialize() {
    loadProducts();
  }

  loadProducts() async {
    creditCards = await _finaceServices.getCreditCards();
    notifyListeners();
  }
}
