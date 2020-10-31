import 'package:flutter/material.dart';
import 'package:ligmone/wallet/models/dash_model.dart';
import 'package:ligmone/wallet/models/payment_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// List<CreditCardModel> getCreditCards() {
//   List<CreditCardModel> creditCards = [];
//   creditCards.add(CreditCardModel(
//       "4616900007729988",
//       "https://resources.mynewsdesk.com/image/upload/ojf8ed4taaxccncp6pcp.png",
//       "06/23",
//       "192"));
//   creditCards.add(CreditCardModel(
//       "3015788947523652",
//       "https://resources.mynewsdesk.com/image/upload/ojf8ed4taaxccncp6pcp.png",
//       "04/25",
//       "217"));
//   return creditCards;
// }

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
