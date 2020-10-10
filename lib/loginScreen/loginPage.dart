import 'package:flutter/material.dart';
import 'package:ligmone/loginScreen/signup.dart';
import 'package:ligmone/screens/bottomNavigation.dart';
import 'package:ligmone/services/authService.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ForgotPassword.dart';
//import 'package:trailblazer/src/shared/constDecoration.dart';

enum LoginType {
  email,
  google,
  facebook,
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _loginUser(
      {@required LoginType type,
      String email,
      String password,
      BuildContext context}) async {
    AuthService _currentUser = Provider.of<AuthService>(context, listen: false);

    try {
      String _returnString;
      switch (type) {
        case LoginType.email:
          _returnString =
              await _currentUser.loginUserWithEmail(email, password);
          break;
        case LoginType.google:
          _returnString = await _currentUser.loginUserWithGoogle();
          break;
        case LoginType.facebook:
          _returnString = await _currentUser.loginUserWithFacebook();
          print(_returnString);
          break;
        default:
      }

      if (_returnString == "success") {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavigationMenu(),
          ),
          (route) => false,
        );
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(_returnString),
            duration: Duration(seconds: 10),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  // Login with facebook

  Widget _facebookButton() {
    return Container(
      child: RaisedButton(
        color: Color(0XFF3b5998),
        onPressed: () {
          _loginUser(type: LoginType.facebook, context: context);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage("assets/facebook-logo.png"), height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Log in with Facebook',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Login with Google

  Widget _googleButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13),
      alignment: Alignment.center,
      child: RaisedButton(
        color: Color(0XFFFFFFFF),
        onPressed: () {
          _loginUser(type: LoginType.google, context: context);
        },
        highlightElevation: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("assets/google_logo.png"), height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _submitButtonnew() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      child: Form(
        child: Column(
          children: <Widget>[
            //email
            SizedBox(height: 25),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.alternate_email),
                hintText: 'Email',
              ),
            ),

            //password
            SizedBox(height: 25),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            //Forgot your password - reset password page
            SizedBox(height: 5),

            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Container(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ForgotPassword()));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ),

            // Login Button routes to Loginpage
            SizedBox(height: 20),
            Builder(
              builder: (context) => RaisedButton(
                  color: Colors.orange[400],
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    _loginUser(
                        type: LoginType.email,
                        email: _emailController.text,
                        password: _passwordController.text,
                        context: context);
                  }),
            ),
            FlatButton(
              child: Text("Dont have an account? Sign up here"),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignUpPage(),
                  ),
                );
              },
            ),

            _googleButton(),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Li',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'g',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'mone',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Color _lightGreen = Color.fromARGB(255, 226, 238, 218);
    final height = MediaQuery.of(context).size.height;
    var children2 = <Widget>[
      SizedBox(height: height * .2),
      _title(),
      _submitButtonnew(),
      _facebookButton(),
      SizedBox(height: height * .055),
    ];
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          //add shape here
          // Positioned(
          //     top: -height * .15,
          //     right: -MediaQuery.of(context).size.width * .4,
          //     child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: children2,
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
