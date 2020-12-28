import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ligmone/utils/constants.dart';
import 'package:ligmone/wallet/models/dash_model.dart';
import 'package:ligmone/wallet/pages/addCreditCard.dart';
import 'package:ligmone/wallet/pages/addExpense.dart';
import 'package:ligmone/wallet/widgets/dash_card.dart';

class AddCardExpense extends StatefulWidget {
  @override
  AddCardExpenseState createState() => AddCardExpenseState();
}

class AddCardExpenseState extends State<AddCardExpense> {
  DashModel dashModel;
  List<DashModel> iconCard = [
    DashModel("Add expense", FontAwesomeIcons.moneyBill, Color(0xFFff415f)),
    DashModel("add Bank card", Icons.credit_card, Colors.deepOrange)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_left,
                size: 60,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Container(
            alignment: Alignment.center,
            child: Text("Enter your expense",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Varela")),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.bars,
                size: 20.0,
                color: Colors.white,
              ),
              onPressed: null,
            ),
          ],
        ),
        body: Form(
          autovalidate: true,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
              ),
              Column(
                //  crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            DashCardWidget(
                              dashCard: iconCard[0],
                            ),
                            // Text("Add expense",
                            //     style: TextStyle(
                            //         fontSize: 20,
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.bold,
                            //         fontFamily: "Varela")),
                          ],
                        ),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddExpense())),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  RaisedButton(
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              DashCardWidget(
                                dashCard: iconCard[1],
                              ),
                              // Text("Addd BankCard",
                              //     style: TextStyle(
                              //         fontSize: 20,
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.bold,
                              //         fontFamily: "Varela")),
                            ],
                          )),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddCreditCard())),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                ],
              ),
            ],
          ),
        ));
  }
}
