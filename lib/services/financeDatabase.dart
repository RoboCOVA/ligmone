import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ligmone/wallet/models/credit_card_model.dart';

class FinanceDatabase {
  //FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<CreditCardModel1> creditCards = [];
  Future<List<CreditCardModel1>> getCreditCards() async =>
      FirebaseFirestore.instance
          .collection("users1")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          FirebaseFirestore.instance
              .collection("users1")
              .doc(result.id)
              .collection("creditCard")
              .get()
              .then((querySnapshot) {
            querySnapshot.docs.forEach((result) {
              CreditCardModel1 creditCard =
                  CreditCardModel1.fromMap(result.data());
              creditCards.add(creditCard);
            });
          });
        });
        return creditCards;
      });

// rew list from snapshot
  // List<CreditCardModel> _brewListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc) {
  //     return CreditCardModel(
  //         cardNo: doc.data()['cardNo'] ?? '',
  //         logo: doc.data()['logo'] ?? '',
  //         expiryDate: doc.data()['expiryDate'] ?? '',
  //         cvv: doc.data()['cvv'] ?? '?');
  //   }).toList();
  // }

  // // get brews stream
  // Stream<List<CreditCardModel>> get brews {
  //   return _cardcollection.snapshots().map(_brewListFromSnapshot);
  // }
}
