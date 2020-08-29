import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ligmone/services/authService.dart';
import 'package:provider/provider.dart';

import 'loginPage.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
  //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController = TextEditingController();
  //bool _validate = false;
  String _email;
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthService _currentUser = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      // backgroundColor: Color(0XFF7A9BEE),
      appBar: AppBar(
        title: Text('Forgot Your Password', style: TextStyle(fontSize: 16.0)),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          // width: MediaQuery.of(context).size.width - 100,
          //height: MediaQuery.of(context).size.height - 100,
          //color: Colors.lightBlue,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 13),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color(0xffdf8e33).withAlpha(100),
                    offset: Offset(2, 4),
                    blurRadius: 8,
                    spreadRadius: 2)
              ],
              color: Colors.white),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "We will mail you a link...Please click on that link to reset your password",
                style: TextStyle(
                    shadows: [
                      Shadow(
                        color: Colors.blue,
                        blurRadius: 10.0,
                        offset: Offset(5.0, 5.0),
                      ),
                      Shadow(
                        color: Colors.red,
                        blurRadius: 10.0,
                        offset: Offset(-5.0, 5.0),
                      ),
                    ],
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Montserrat',
                    fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (value) =>
                    value.isEmpty ? " Enter email address" : null,
                onChanged: (email) => _email = email,
                // controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.alternate_email),
                  hintText: 'Enter the Email',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              RaisedButton(
                  color: Colors.orange,
                  child: Text(
                    'Reset Password',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () async {
                    try {
                      await _currentUser.resetPassword(_email);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                        (route) => false,
                      );
                    } catch (e) {
                      print(e.toString());
                    }
                  }),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Container(
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage()));
                    },
                    child: Text(
                      "Return to Login Page",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* 
FloatingActionButton(
                child: Text("Login"),
                onPressed: () async {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                    (route) => false,
                  );
                }),
*/
