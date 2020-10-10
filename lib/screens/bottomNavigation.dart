import 'package:flutter/material.dart';

import 'package:ligmone/homePage.dart';
import 'package:ligmone/loginScreen/loginPage.dart';
import 'package:ligmone/screens/LoansPage.dart';
import 'package:ligmone/screens/userAccounts.dart';

import 'package:ligmone/screens/user_profile.dart';
import 'package:ligmone/services/patform_alert_dialog.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../constants.dart';
import 'chatService.dart';

class BottomNavigationMenu extends StatefulWidget {
  @override
  _BottomNavigationMenuState createState() => _BottomNavigationMenuState();
}

class _BottomNavigationMenuState extends State<BottomNavigationMenu> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    LoansPage(),
    ChatService(),
    UserAccounts(),
  ];

  // Instantiate  firebase
  // FirebaseAuth _auth = FirebaseAuth.instance;
  // Future<void> _signOut() async {
  //   try {
  //     final googleSignIn = GoogleSignIn();
  //     await googleSignIn.signOut();
  //     final facebookLogin = FacebookLogin();
  //     await facebookLogin.logOut();
  //     await _auth.signOut();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<void> _confirmSignOut() async {
  //   final didRequestSignOut = await PlatformAlertDialog(
  //     title: 'Logout',
  //     content: 'Are you sure that you want to logout?',
  //     cancelActionText: 'Cancel',
  //     defaultActionText: 'Logout',
  //   ).show(context);
  //   if (didRequestSignOut == true) {
  //     _signOut();
  //   }
  // }

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

  // void _openDrawer() {
  //   _scaffoldKey.currentState.openDrawer();
  // }

  // void _closeDrawer() {
  //   Navigator.of(context).pop();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          // backgroundColor: Colors.blue[400],
          backgroundColor: kPrimaryColor,
          leading: new IconButton(
              icon: new Icon(Icons.account_circle, color: Colors.white),
              onPressed: () => _scaffoldKey.currentState.openDrawer())),
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
            CustomListMenu(Icons.menu, 'Transactions', () => {}),
            CustomListMenu(MdiIcons.card, 'Bank Cards', () => {}),
            CustomListMenu(
                Icons.notification_important, 'Notifications', () => {}),
            CustomListMenu(Icons.account_balance, 'Balance', () => {}),
            CustomListMenu(Icons.settings, 'Settings', () => {}),
            SizedBox(
              height: 10.0,
            ),
            FlatButton(
              onPressed: () => _confirmSignOut(context),
              // onPressed: () async {
              //   AuthService _currentUser =
              //       Provider.of<AuthService>(context, listen: false);
              //   _currentUser.signOut();
              // },
              color: Colors.orange,
              padding: EdgeInsets.all(10.0),
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
          BottomNavigationBarItem(
              icon: Icon(MdiIcons.message, color: Colors.deepOrange, size: 32),
              title: Text(
                'Chat',
                style: TextStyle(color: Colors.black),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card, color: Colors.deepOrange, size: 32),
              title: Text(
                'Money',
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
                    Icon(icon),
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
