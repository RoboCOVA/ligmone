import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ligmone/constants.dart';
import 'package:ligmone/loginScreen/loginPage.dart';
import 'package:ligmone/screens/user_profile.dart';
import 'package:ligmone/wallet/pages/bankAccount.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UserAccounts extends StatefulWidget {
  UserAccounts({Key key}) : super(key: key);

  @override
  _UserAccountsState createState() => _UserAccountsState();
}

class _UserAccountsState extends State<UserAccounts> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  void inputData() {
    final User user = auth.currentUser;
    final uid = user.uid;
    // here you write the codes to input the data into firestore
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.fromLTRB(0.0, 14.0, 0.0, 0.0),
      child: Scaffold(
        backgroundColor: Color(0XFFFEFEFE),
        key: _scaffoldKey,
        // appBar: AppBar(
        //     title: Text("Dashboard"),
        //     leading: new IconButton(
        //         icon: new Icon(Icons.account_circle),
        //         onPressed: () => _scaffoldKey.currentState.openDrawer())),
        body: BankAccountPage(),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(color: appbarcolor
                      //gradient: LinearGradient(
                      //  colors: <Color>[Colors.blue, Colors.blue[300]])
                      ),
                  child: Container(
                    child: Column(
                      children: [
                        Material(
                          borderRadius: BorderRadius.all(Radius.circular(80.0)),
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/account.png',
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Ligmone',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
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
              CustomListMenu(
                  Icons.lock,
                  'Log Out',
                  () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        )
                      }),
            ],
          ),
        ),
      ),
    );
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
