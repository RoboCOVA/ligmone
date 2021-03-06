import 'package:flutter/material.dart';
import 'package:ligmone/models/user.dart';
import 'package:ligmone/screens/bottomNavigation.dart';
import 'package:ligmone/services/authService.dart';
import 'package:provider/provider.dart';

import '../utils/splash_screen.dart';

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
    AuthService _currentUser = Provider.of<AuthService>(context, listen: false);
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
    OurUser _user = OurUser();
    switch (_authStatus) {
      case AuthStatus.notLoggin:
        retVal = SplashScreen();
        break;
      case AuthStatus.loggedIn:
        retVal = BottomNavigationMenu(currentUserId: _user.uid);
        break;
      default:
    }
    return retVal;
  }
}
