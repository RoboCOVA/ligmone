import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:ligmone/utils/constants.dart';

class AddCreditCard extends StatefulWidget {
  @override
  AddCreditCardState createState() => AddCreditCardState();
}

class AddCreditCardState extends State<AddCreditCard> {
  var selectedCurrency, selectedType;
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();
  TextEditingController _balanceController = TextEditingController();
  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    String formatDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
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
          key: _formKeyValue,
          autovalidate: true,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Enter card Number',
                    hintText: 'Enter card number',
                  ),
                  controller: _amountController,
                  keyboardType: TextInputType.number),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'MM/YY',
                  hintText: 'Card Expire Date',
                ),
                controller: _nameController,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Enter cvv Number',
                    hintText: 'Enter cvv number',
                  ),
                  controller: _cvvController,
                  keyboardType: TextInputType.number),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Enter your balance',
                    hintText: 'Enter your balance',
                  ),
                  controller: _balanceController,
                  keyboardType: TextInputType.number),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4 - 80,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("Submit",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Varela")),
                            ],
                          )),
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection("users1")
                            .doc(user.uid)
                            .collection("creditCard")
                            .add({
                          '_cardNo': _amountController.text,
                          "_expiryDate": _nameController.text,
                          '_cvv': _cvvController.text,
                          '_logo':
                              "https://resources.mynewsdesk.com/image/upload/ojf8ed4taaxccncp6pcp.png",
                          '_createDateTime': formatDate,
                          "_balance": int.parse(_balanceController.text),
                          "_expense": 0,
                          "_foodCost": 0,
                          "_billCost": 0,
                          "_homeImprovementCost": 0,
                          "_transportationCost": 0,
                          "_atmWithdrawl": 0,
                          "_healthCost": 0,
                          "_saving": 0
                        }).then((value) => print(value.id));
                        Navigator.pop(context);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                ],
              ),
            ],
          ),
        ));
  }
}
