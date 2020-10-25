import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:ligmone/services/financeDatabase.dart';
import 'package:ligmone/wallet/models/credit_card_model.dart';

class FinanceServicer extends ChangeNotifier {
  FinanceDatabase _finaceServices = FinanceDatabase();
  List<CreditCardModel1> creditCards = [];
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FinanceServicer.initialize() {
    loadProducts();
  }

  loadProducts() async {
    creditCards = await _finaceServices.getCreditCards();
    notifyListeners();
  }
}
