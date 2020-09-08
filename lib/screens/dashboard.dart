import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ligmone/screens/loanAcoountChart.dart';

class Dashboard extends StatelessWidget {
  final services = [
    "Manage",
    "Balance",
    "Bank Cards",
    "Account",
    "Notifications",
    "Transactions",
    "Settings"
  ];

  final icons = [
    FontAwesomeIcons.moneyBill,
    FontAwesomeIcons.balanceScale,
    Icons.card_membership,
    Icons.account_balance,
    Icons.notifications,
    FontAwesomeIcons.moneyCheck,
    Icons.settings
  ];
  final images = [
    "assets/management.png",
    "assets/finance.png",
    "assets/data.png",
    "assets/payment.png",
    "assets/communication.png",
    "assets/services.png",
    "assets/personalize.png",
    "assets/account.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(7),
        child: GridView.builder(
            itemCount: services.length,
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2.35)),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoanCharts('Hello There'),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      // Image.asset(images[index], height: 40, width: 40),
                      Icon(icons[index], color: Colors.deepOrange, size: 32),

                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          services[index],
                          style: TextStyle(
                              fontSize: 16,
                              height: 1.2,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}

//end
