import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final services = [
    "Management",
    "Finance Services",
    "Data Analytics",
    "Payment services",
    "Communicatons",
    "Service Providers",
    "Personalization",
    "Accounts"
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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2.35)),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(images[index], height: 50, width: 50),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      services[index],
                      style: TextStyle(
                          fontSize: 12,
                          height: 1.2,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ));
            }));
  }
}

//end
