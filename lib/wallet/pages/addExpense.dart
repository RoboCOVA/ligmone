import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:ligmone/utils/constants.dart';
import 'package:ligmone/services/financeServicer.dart';
import 'package:provider/provider.dart';

class AddExpense extends StatefulWidget {
  @override
  AddExpenseState createState() => AddExpenseState();
}

class AddExpenseState extends State<AddExpense> {
  var selectedCurrency, selectedType;
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  User user = FirebaseAuth.instance.currentUser;
  int type = 1;
  List<String> _accountType = <String>[
    'Food and Drink',
    'Bills',
    'Home Improvement',
    'Transportation',
    'ATM Withdrawl',
    'Health',
    'Saving',
  ];

  @override
  Widget build(BuildContext context) {
    int count = 0;
    var now = DateTime.now();
    String formatDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    final cardProvider = Provider.of<FinanceServicer>(context);
    if (cardProvider.creditCards.isNotEmpty) {
      count = cardProvider.creditCards.length;
      count = count;
    }
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
                    hintText: 'Enter Amount',
                  ),
                  controller: _amountController,
                  keyboardType: TextInputType.number),
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'enter description',
                  hintText: 'Description; taxi, bus, food, etc',
                ),
                controller: _nameController,
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 50.0),
                  DropdownButton(
                    focusColor: Colors.grey.shade50,
                    items: _accountType
                        .map((value) => DropdownMenuItem(
                              child: Text(
                                value,
                                style: TextStyle(
                                    //  color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Varela"),
                              ),
                              value: value,
                            ))
                        .toList(),
                    onChanged: (selectedAccountType) {
                      // print('$selectedAccountType');
                      setState(() {
                        selectedType = selectedAccountType;
                        if (selectedType == 'Food and Drink') {
                          type = 1;
                        } else if (selectedType == 'Bills') {
                          type = 2;
                        } else if (selectedType == 'Transportation') {
                          type = 3;
                        } else if (selectedType == 'ATM Withdrawl') {
                          type = 4;
                        } else if (selectedType == 'Health') {
                          type = 5;
                        } else if (selectedType == 'Health') {
                          type = 6;
                        } else {
                          type = 7;
                        }
                      });
                    },
                    value: selectedType,
                    isExpanded: false,
                    hint: Text(
                      'Choose Account Type',
                      style: TextStyle(
                          //color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Varela"),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2 - 80,
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
                            .collection("expense")
                            .add({
                          '_name': _nameController.text,
                          "_amount": int.parse(_amountController.text),
                          "_paymentType": type,
                          '_createDateTime': formatDate,
                        }).then((value) => print(value.id));
                        if (type == 1) {
                          await FirebaseFirestore.instance
                              .collection("users1")
                              .doc(user.uid)
                              .collection("creditCard")
                              .doc('iDavK2s1cbAExcrnFsdg')
                              .update({
                            '_balance': cardProvider.creditCards[0].balance -
                                int.parse(_amountController.text),
                            "_expense": cardProvider.creditCards[0].expense +
                                int.parse(_amountController.text),
                            "_foodCost": cardProvider.creditCards[0].food +
                                int.parse(_amountController.text),
                          });
                        } else if (type == 2) {
                          await FirebaseFirestore.instance
                              .collection("users1")
                              .doc(user.uid)
                              .collection("creditCard")
                              .doc('iDavK2s1cbAExcrnFsdg')
                              .update({
                            '_balance': cardProvider.creditCards[0].balance -
                                int.parse(_amountController.text),
                            "_expense": cardProvider.creditCards[0].expense +
                                int.parse(_amountController.text),
                            "_billCost": cardProvider.creditCards[0].bill +
                                int.parse(_amountController.text),
                          });
                        } else if (type == 3) {
                          await FirebaseFirestore.instance
                              .collection("users1")
                              .doc(user.uid)
                              .collection("creditCard")
                              .doc('iDavK2s1cbAExcrnFsdg')
                              .update({
                            '_balance': cardProvider.creditCards[0].balance -
                                int.parse(_amountController.text),
                            "_expense": cardProvider.creditCards[0].expense +
                                int.parse(_amountController.text),
                            "_homeImprovementCost":
                                cardProvider.creditCards[0].home +
                                    int.parse(_amountController.text),
                          });
                        } else if (type == 4) {
                          await FirebaseFirestore.instance
                              .collection("users1")
                              .doc(user.uid)
                              .collection("creditCard")
                              .doc('iDavK2s1cbAExcrnFsdg')
                              .update({
                            '_balance': cardProvider.creditCards[0].balance -
                                int.parse(_amountController.text),
                            "_expense": cardProvider.creditCards[0].expense +
                                int.parse(_amountController.text),
                            "_transportationCost":
                                cardProvider.creditCards[0].transport +
                                    int.parse(_amountController.text),
                          });
                        } else if (type == 5) {
                          await FirebaseFirestore.instance
                              .collection("users1")
                              .doc(user.uid)
                              .collection("creditCard")
                              .doc('iDavK2s1cbAExcrnFsdg')
                              .update({
                            '_balance': cardProvider.creditCards[0].balance -
                                int.parse(_amountController.text),
                            "_expense": cardProvider.creditCards[0].expense +
                                int.parse(_amountController.text),
                            "_atmWithdrawl": cardProvider.creditCards[0].atm +
                                int.parse(_amountController.text),
                          });
                        } else if (type == 6) {
                          await FirebaseFirestore.instance
                              .collection("users1")
                              .doc(user.uid)
                              .collection("creditCard")
                              .doc('iDavK2s1cbAExcrnFsdg')
                              .update({
                            '_balance': cardProvider.creditCards[0].balance -
                                int.parse(_amountController.text),
                            "_expense": cardProvider.creditCards[0].expense +
                                int.parse(_amountController.text),
                            "_healthCost": cardProvider.creditCards[0].health +
                                int.parse(_amountController.text),
                          });
                        } else if (type == 7) {
                          await FirebaseFirestore.instance
                              .collection("users1")
                              .doc(user.uid)
                              .collection("creditCard")
                              .doc('iDavK2s1cbAExcrnFsdg')
                              .update({
                            '_balance': cardProvider.creditCards[0].balance -
                                int.parse(_amountController.text),
                            "_expense": cardProvider.creditCards[0].expense +
                                int.parse(_amountController.text),
                            "_healthCost": cardProvider.creditCards[0].health +
                                int.parse(_amountController.text),
                          });
                        }

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
