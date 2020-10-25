import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ligmone/services/financeServicer.dart';
import 'package:ligmone/wallet/data/data.dart';
import 'package:ligmone/wallet/models/credit_card_model.dart';
import 'package:ligmone/wallet/pages/overview_page.dart';
import 'package:ligmone/wallet/utils/screen_size.dart';
import 'package:ligmone/wallet/widgets/credit_card.dart';
import 'package:ligmone/wallet/widgets/dash_card.dart';
import 'package:ligmone/wallet/widgets/payment_card.dart';
import 'package:provider/provider.dart';

class BankAccountPage extends StatefulWidget {
  @override
  _BankAccountPageState createState() => _BankAccountPageState();
}

class _BankAccountPageState extends State<BankAccountPage> {
  List<CreditCardModel1> creditCards = [];

  @override
  void initState() {
    super.initState();

    //creditCards = FinanceDatabase().creditCardinfo();
    print('here');
    // configLocalNotification();
  }

  @override
  void dispose() {
    // creditCards.clear();
    super.dispose();
  }

  void updateCreditCard() async {
    await FirebaseFirestore.instance
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
            //print(result.data());
            CreditCardModel1 creditCard =
                CreditCardModel1.fromMap(result.data());
            creditCards.add(creditCard);
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    final cardProvider = Provider.of<FinanceServicer>(context);

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            color: Colors.grey.shade50,
            height: _media.height / 2,
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Stack(
                        children: <Widget>[
                          Material(
                            elevation: 4,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/bg1.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 0.3,
                            child: Container(
                              color: Colors.black87,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    height: _media.longestSide <= 775
                        ? _media.height / 4
                        : _media.height / 4.3,
                    width: _media.width,
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowGlow();
                      },
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(bottom: 10),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        //itemCount: getCreditCards().length,
                        itemCount: cardProvider.creditCards.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OverviewPage())),
                              child: CreditCard(
                                card: cardProvider.creditCards[index] ?? '',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: _media.longestSide <= 775
                      ? screenAwareSize(20, context)
                      : screenAwareSize(35, context),
                  left: 10,
                  right: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // IconButton(
                          //   icon: Icon(
                          //     Icons.menu,
                          //     color: Colors.white,
                          //     size: 28,
                          //   ),
                          //   onPressed: () => print("Menu"),
                          // ),
                          // IconButton(
                          //   icon: Icon(
                          //     Icons.notifications_none,
                          //     color: Colors.white,
                          //     size: 28,
                          //   ),
                          //   onPressed: () => print("notification"),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Accounts",
                              style: TextStyle(
                                  fontSize: _media.longestSide <= 775 ? 35 : 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Varela"),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 36,
                            ),
                            onPressed: () => print("add"),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey.shade50,
            width: _media.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 10, bottom: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Take action",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  height: screenAwareSize(
                      _media.longestSide <= 775 ? 110 : 80, context),
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowGlow();
                    },
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: getIconsCard().length,
                      itemBuilder: (BuildContext context, int index) {
                        // if (index == 0) {
                        //   return Padding(
                        //       padding: EdgeInsets.only(right: 10),
                        //       child: AddButton());
                        // }

                        return Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: DashCardWidget(
                            dashCard: getIconsCard()[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, bottom: 15, right: 10, top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "All",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Received",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Sent",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25.0,
                    bottom: 15,
                    top: 15,
                  ),
                  child: Text(
                    "23 oct 2021",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowGlow();
                      },
                      child: ListView.separated(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 85.0),
                            child: Divider(),
                          );
                        },
                        padding: EdgeInsets.zero,
                        itemCount: getPaymentsCard().length,
                        itemBuilder: (BuildContext context, int index) {
                          return PaymentCardWidget(
                            payment: getPaymentsCard()[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}