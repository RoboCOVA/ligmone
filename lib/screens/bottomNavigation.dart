import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ligmone/bankAccount/screens/bankAccountHome.dart';
//import 'package:ligmone/chat/homechat.dart';

import 'package:ligmone/loanHome.dart';
import 'package:ligmone/loginScreen/loginPage.dart';
import 'package:ligmone/money/moneyHomepage.dart';

import 'package:ligmone/screens/user_profile.dart';
import 'package:ligmone/services/patform_alert_dialog.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavigationMenu extends StatefulWidget {
  final String currentUserId;

  BottomNavigationMenu({Key key, @required this.currentUserId})
      : super(key: key);

  @override
  _BottomNavigationMenuState createState() =>
      _BottomNavigationMenuState(currentUserId: currentUserId);
}

class _BottomNavigationMenuState extends State<BottomNavigationMenu> {
  _BottomNavigationMenuState({Key key, @required this.currentUserId});

  final String currentUserId;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  SharedPreferences prefs;
  TextEditingController controllerNickname;

  String nickname = '';

  bool isLoading = false;
  bool isLoggedIn = true;
  User currentUser;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    this.setState(() {
      isLoading = true;
    });

    prefs = await SharedPreferences.getInstance();

    this.setState(() {
      isLoading = false;
    });
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);
    if (didRequestSignOut == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
      //_signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      MoneyHomePage(),
      LoanHome(),
      //  ChatScreen(currentUserId: prefs.getString('id')),
      //UserAccounts(),
      BankAccountHome(),
    ];
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[Colors.blue, Colors.blue[300]])),
                child: Container(
                  child: Column(
                    children: [
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/icon.png',
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Ligmone',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      )
                    ],
                  ),
                )),
            CustomListMenu(
              Icons.person,
              'Profile',
              () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePagex(),
                  ),
                )
              },
            ),
            CustomListMenu(Icons.settings, 'Settings', () => {}),
            CustomListMenu(
                MdiIcons.walletMembership, 'Member benefits', () => {}),
            CustomListMenu(Icons.card_giftcard, 'Invite friends', () => {}),
            CustomListMenu(Icons.account_balance, 'About', () => {}),
            CustomListMenu(MdiIcons.fileDocumentEdit, 'Feedback', () => {}),
            CustomListMenu(MdiIcons.paperRollOutline, 'Legal', () => {}),
            SizedBox(
              height: 6.0,
            ),
            FlatButton(
              onPressed: () => _confirmSignOut(context),
              color: Colors.orange,
              padding: EdgeInsets.all(8.0),
              child: Column(
                // Replace with a Row for horizontal icon + text
                children: <Widget>[Icon(Icons.person), Text("Logout")],
              ),
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.deepOrange,
                size: 32,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.black),
              )),
          BottomNavigationBarItem(
              icon:
                  Icon(Icons.insert_chart, color: Colors.deepOrange, size: 32),
              title: Text(
                'Loans',
                style: TextStyle(color: Colors.black),
              )),
          // BottomNavigationBarItem(
          //     icon: Icon(MdiIcons.message, color: Colors.deepOrange, size: 32),
          //     title: Text(
          //       'Chat',
          //       style: TextStyle(color: Colors.black),
          //     )),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card, color: Colors.deepOrange, size: 32),
              title: Text(
                'Account',
                style: TextStyle(color: Colors.black),
              )),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onTabTapped,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

// ignore: must_be_immutable
class CustomListMenu extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;
  CustomListMenu(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
          splashColor: Colors.deepOrange,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    Icon(
                      icon,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
