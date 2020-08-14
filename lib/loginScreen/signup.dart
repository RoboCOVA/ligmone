import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ligmone/states/currentUser.dart';
import 'package:ligmone/utils/bezierContainer.dart';
import 'package:provider/provider.dart';

import 'loginPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool loading = false;
  // text field state
  void _signUpUser(String email, String password, BuildContext context,
      String firstName, String lastName) async {
    CurrentUser _curretUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString =
          await _curretUser.signUpUser(email, password, firstName, lastName);
      if (_returnString == "success") {
        Navigator.of(context).pop();
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

  Widget _submitButtonNew() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      child: Form(
        child: Column(
          children: <Widget>[
            //FistName
            SizedBox(height: 20),
            TextFormField(
              controller: _firstNameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                hintText: 'First Name',
              ),
            ),
            //LastName
            SizedBox(height: 15),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                hintText: 'Last Name',
              ),
            ),

            //email
            SizedBox(height: 15),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.alternate_email),
                hintText: 'Email',
              ),
            ),
            //password
            SizedBox(height: 15),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            // COnfirm password

            SizedBox(height: 15),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: 'Confirm Password',
              ),
              obscureText: true,
            ),

            SizedBox(height: 15),
            Builder(
              builder: (context) => RaisedButton(
                  color: Colors.orange[400],
                  child: Text(
                    'Register Now',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_passwordController.text ==
                        _confirmPasswordController.text) {
                      //  setState(() => loading = true);

                      _signUpUser(
                          _emailController.text,
                          _passwordController.text,
                          context,
                          _firstNameController.text,
                          _lastNameController.text);
                    } else {
                      //  setState(() => loading = true);

                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Password do not match"),
                          duration: Duration(seconds: 10),
                        ),
                      );
                    }
                  }
                  //setState(() => loading = false);
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
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
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 35,
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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .10),
                    _title(),
                    _submitButtonNew(),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
