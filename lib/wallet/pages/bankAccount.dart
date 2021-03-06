import 'package:flutter/material.dart';
import 'package:ligmone/services/financeServicer.dart';
import 'package:ligmone/services/paymentServicer.dart';
import 'package:ligmone/wallet/data/data.dart';
import 'package:ligmone/wallet/models/credit_card_model1.dart';
import 'package:ligmone/wallet/pages/addCardExpense.dart';
import 'package:ligmone/wallet/pages/overview_page.dart';
import 'package:ligmone/wallet/pages/overview_page1.dart';
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
  }

  @override
  void dispose() {
    // creditCards.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    final _media = MediaQuery.of(context).size;
    int count = 0, payCount = 0;
    final cardProvider = Provider.of<FinanceServicer>(context);
    if (cardProvider.creditCards.isNotEmpty) {
      count = cardProvider.creditCards.length;
      count = count;
      print(count);
    }
    final paymentProvider = Provider.of<PaymentServicer>(context);
    if (paymentProvider.paymentHistory.isNotEmpty) {
      payCount = paymentProvider.paymentHistory.length;
      payCount = payCount;
    }
    //print(count);
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
                      child: creditPay(count, cardProvider),
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
                        children: <Widget>[],
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddCardExpense()));
                              })
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
                        "Payment History",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),

                      Spacer(),
                      // Icon(
                      //   Icons.arrow_forward_ios,
                      //   color: Colors.grey,
                      //   size: 20,
                      // ),
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
                    '${date.year.toString()}' +
                        '-' +
                        '${date.month.toString()}' +
                        '-' +
                        '${date.day.toString()}',
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
                      child: paymentHistory(payCount, paymentProvider),
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

  Widget creditPay(int count, var cardProvider) {
    if (count == 0 ||
        cardProvider.creditCards.isEmpty ||
        cardProvider.creditCards == null) {
      return Container(
        child: Text('Add your card here'),
      );
    } else {
      return ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: 10),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          //itemCount: getCreditCards().length,
          itemCount: count,
          itemBuilder: (context, index) {
            if (count != null && cardProvider.creditCards != null) {
              return Padding(
                padding: EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OverviewPage1(
                              creditCard: cardProvider.creditCards[index]))),
                  child: CreditCard(
                    card: cardProvider.creditCards[index],
                  ),
                ),
              );
            } else if (cardProvider.creditCards == null) {
              return Container(
                child: Text(''),
              );
            } else {
              return Container(
                child: Text(''),
              );
            }
          });
    }
  }

  Widget paymentHistory(int payCount, var paymentProvider) {
    if (payCount == 0 || paymentProvider.paymentHistory.isEmpty) {
      return Container(
        child: Text(' '),
      );
    } else {
      return ListView.separated(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 85.0),
            child: Divider(),
          );
        },
        padding: EdgeInsets.zero,
        itemCount: payCount,
        itemBuilder: (BuildContext context, int index) {
          return PaymentCardWidget(
            payment: paymentProvider.paymentHistory[index],
          );
        },
      );
    }
  }
}
