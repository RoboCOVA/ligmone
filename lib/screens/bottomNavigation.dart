import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ligmone/homePage.dart';
import 'package:ligmone/screens/LoansPage.dart';
import 'package:ligmone/screens/userAccounts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'chatService.dart';

class BottomNavigationMenu extends StatefulWidget {
  @override
  _BottomNavigationMenuState createState() => _BottomNavigationMenuState();
}

class _BottomNavigationMenuState extends State<BottomNavigationMenu> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    LoansPage(),
    ChatService(),
    UserAccounts(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
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
                icon: Icon(FontAwesomeIcons.creditCard,
                    color: Colors.deepOrange, size: 32),
                title: Text(
                  'Loans',
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
                icon: Icon(MdiIcons.chat, color: Colors.deepOrange, size: 32),
                title: Text(
                  'Chat',
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
                icon:
                    Icon(MdiIcons.account, color: Colors.deepOrange, size: 32),
                title: Text(
                  'Account',
                  style: TextStyle(color: Colors.black),
                )),
          ]),
      endDrawer: Drawer(
          child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.deepOrange, Colors.orangeAccent])),
              child: Text('Ligmone')),
          ListTile(title: Text('Profile'), onTap: () {}),
          ListTile(
            title: Text('Transcations'),
          ),
          ListTile(
            title: Text('Bank Cards'),
          ),
          ListTile(
            title: Text('Notifications'),
          ),
          ListTile(
            title: Text('Payment'),
          ),
          ListTile(
            title: Text('Settings'),
          )
        ],
      )),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
