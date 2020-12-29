import 'package:flutter/material.dart';
import 'package:ligmone/wallet/models/credit_card_model1.dart';
import 'package:ligmone/wallet/models/dash_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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

List<CreditCardModel1> getCreditCards() {
  List<CreditCardModel1> cardinfo = [
    CreditCardModel1("1234567890123456", " ", "04/22", "576", 434, 670, 656,
        334, 1113, 34343, 532, 222, 111),
    CreditCardModel1("1234567890123456", " ", "04/22", "576", 434, 670, 656,
        334, 1113, 34343, 532, 222, 111),
  ];

  return cardinfo;
}
