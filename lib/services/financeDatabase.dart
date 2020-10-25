import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ligmone/wallet/models/credit_card_model.dart';

class FinanceDatabase {
  User user = FirebaseAuth.instance.currentUser;
  List<CreditCardModel> creditCards = [];
  Future<List<CreditCardModel>> getCreditCards() async =>
      FirebaseFirestore.instance
          .collection("users1")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          FirebaseFirestore.instance
              .collection("users1")
              .doc(user.uid)
              .collection("creditCard")
              .get()
              .then((querySnapshot) {
            querySnapshot.docs.forEach((result) {
              CreditCardModel creditCard =
                  CreditCardModel.fromMap(result.data());
              creditCards.add(creditCard);
            });
          });
        });
        return creditCards;
      });
}
