import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ligmone/wallet/models/credit_card_model.dart';
import 'package:ligmone/wallet/models/credit_card_model1.dart';
import 'package:ligmone/wallet/models/payment_model.dart';

class FinanceDatabase {
  User user = FirebaseAuth.instance.currentUser;
  List<CreditCardModel> creditCards = [];
  List<PaymentModel> paymentInfo = [];
  List<CreditCardModel1> creditCards1 = [];

  Future<List<CreditCardModel>> getCreditCards() async =>
      await FirebaseFirestore.instance
          .collection("users1")
          .doc(user.uid)
          .collection("creditCard")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          CreditCardModel creditCard = CreditCardModel.fromMap(result.data());
          creditCards.add(creditCard);
        });

        return creditCards;
      });

  Future<List<PaymentModel>> getPayment() async =>
      await FirebaseFirestore.instance
          .collection("users1")
          .doc(user.uid)
          .collection("expense")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          PaymentModel myExpense = PaymentModel.fromMap(result.data());
          paymentInfo.add(myExpense);
        });

        return paymentInfo;
      });

  Future<List<CreditCardModel1>> getCreditCards1() async =>
      await FirebaseFirestore.instance
          .collection("users1")
          .doc(user.uid)
          .collection("creditCard")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          CreditCardModel1 creditCard = CreditCardModel1.fromMap(result.data());
          creditCards1.add(creditCard);
        });

        return creditCards1;
      });
  // Future<void> sendExpense(PaymentModel payment) async =>
  //     await FirebaseFirestore.instance
  //         .collection("users1")
  //         .doc(user.uid)
  //         .collection("expense")
  //         .add({
  //       '_name': payment.amount,
  //       "_amount": payment.amount,
  //       "_paymentType": payment.type
  //     }).then((value) => print(value.id));
}
