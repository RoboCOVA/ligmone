import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ligmone/wallet/models/credit_card_model.dart';
import 'package:ligmone/wallet/models/payment_model.dart';

class FinanceDatabase {
  User user = FirebaseAuth.instance.currentUser;
  List<CreditCardModel> creditCards = [];
  List<PaymentModel> paymentInfo = [];
  // Future<List<CreditCardModel>> getCreditCards() async =>
  //     FirebaseFirestore.instance
  //         .collection("users1")
  //         .get()
  //         .then((querySnapshot) {
  //       querySnapshot.docs.forEach((result) {
  //         FirebaseFirestore.instance
  //             .collection("users1")
  //             .doc(user.uid)
  //             .collection("creditCard")
  //             .get()
  //             .then((querySnapshot) {
  //           querySnapshot.docs.forEach((result) {
  //             CreditCardModel creditCard =
  //                 CreditCardModel.fromMap(result.data());
  //             creditCards.add(creditCard);
  //           });
  //         });
  //       });
  //       return creditCards;
  //     });
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
