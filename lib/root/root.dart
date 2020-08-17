import 'package:flutter/material.dart';
import 'package:ligmone/screens/bottomNavigation.dart';
import 'package:ligmone/states/currentUser.dart';
import 'package:provider/provider.dart';

import '../splash_screen.dart';

enum AuthStatus {
  notLoggin,
  loggedIn,
}

class OurRoot extends StatefulWidget {
  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.notLoggin;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    // get the state, check current user, set AuthStatus based on state
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.onStartUp();

    if (_returnString == "success") {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    } else {
      setState(() {
        _authStatus = AuthStatus.notLoggin;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch (_authStatus) {
      case AuthStatus.notLoggin:
        retVal = SplashScreen();
        break;
      case AuthStatus.loggedIn:
        retVal = BottomNavigationMenu();
        break;
      default:
    }
    return retVal;
  }
}
