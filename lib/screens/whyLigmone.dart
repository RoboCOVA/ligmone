import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ligmone/screens/bottomNavigation.dart';

import 'package:ligmone/utils/size_config.dart';
import 'package:ligmone/splash/components/default_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WhyLigmone extends StatefulWidget {
  @override
  WhyLigmoneState createState() => WhyLigmoneState();
}

class WhyLigmoneState extends State<WhyLigmone> {
  int currentPage = 0;
  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  SharedPreferences prefs;

  String id = '';

  bool isLoading = false;

  final FocusNode focusNodeNickname = FocusNode();

  void readLocal() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id') ?? '';

    // Force refresh input
    setState(() {});
  }

  Future myFuture;
  @override
  void initState() {
    super.initState();
    readLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Congratulations!\n"
                  "Your Application is Recieved\n"
                  "and we will get back to \n"
                  "As soon as possible\n\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.normal,
                      fontSize: 25),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Exit to Home",
                      // press: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => LoginPage()),
                      //   );
                      // },
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BottomNavigationMenu(currentUserId: id),
                            ));
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
