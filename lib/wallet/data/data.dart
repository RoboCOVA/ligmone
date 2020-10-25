import 'package:flutter/material.dart';
import 'package:ligmone/wallet/models/credit_card_model.dart';
import 'package:ligmone/wallet/models/dash_model.dart';
import 'package:ligmone/wallet/models/payment_model.dart';
import 'package:ligmone/wallet/models/user_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

List<CreditCardModel1> getCreditCards() {
  List<CreditCardModel1> creditCards = [];
  creditCards.add(CreditCardModel1(
      "4616900007729988",
      "https://resources.mynewsdesk.com/image/upload/ojf8ed4taaxccncp6pcp.png",
      "06/23",
      "192"));
  creditCards.add(CreditCardModel1(
      "3015788947523652",
      "https://resources.mynewsdesk.com/image/upload/ojf8ed4taaxccncp6pcp.png",
      "04/25",
      "217"));
  return creditCards;
}

List<UserModel> getUsersCard() {
  List<UserModel> userCards = [
    UserModel("Anna", "assets/images/users/anna.jpeg"),
    UserModel("Gillian", "assets/images/users/gillian.jpeg"),
    UserModel("Judith", "assets/images/users/judith.jpeg"),
  ];

  return userCards;
}

List<DashModel> getIconsCard() {
  List<DashModel> iconCard = [
    DashModel("My offers", Icons.local_offer, Color(0xFFffd60f)),
    DashModel("Shopping loans", Icons.shopping_cart, Color(0xFFff415f)),
    DashModel("Personal loans", Icons.insert_chart, Color(0xFF50f3e2)),
    DashModel("Auto loans", MdiIcons.car, Colors.grey),
    DashModel("Credit Cards", MdiIcons.creditCardMultiple, Colors.deepOrange),
    DashModel("Home loans", MdiIcons.homeCity, Colors.lightBlue[100]),
    DashModel("Auto Insurance", MdiIcons.carConnected, Colors.green),
  ];

  return iconCard;
}

List<PaymentModel> getPaymentsCard() {
  List<PaymentModel> paymentCards = [
    PaymentModel(Icons.receipt, Color(0xFFffd60f), "Florenti Restaurant",
        "07-23", "20.04", 251.00, -1),
    PaymentModel(Icons.monetization_on, Color(0xFFff415f), "Transfer To Anna",
        "07-23", "14.01", 64.00, -1),
    PaymentModel(Icons.location_city, Color(0xFF50f3e2), "Loan To Sanchez",
        "07-23", "10.04", 1151.00, -1),
    PaymentModel(Icons.train, Colors.green, "Train ticket to Turkey", "07-23",
        "09.04", 37.00, -1),
  ];

  return paymentCards;
}
