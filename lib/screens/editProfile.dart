import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<EditProfile> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _birthdayController = TextEditingController();
  TextEditingController _mobilePhoneController = TextEditingController();

  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future myFuture;
  @override
  void initState() {
    super.initState();

    // assign this variable your Future
    myFuture = getFuture();
  }

  Future<FirebaseUser> getFuture() async {
    return _auth.currentUser();
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
              controller: _mobilePhoneController,
              decoration: InputDecoration(
                prefixIcon: Icon(FontAwesomeIcons.phone),
                hintText: 'phone number',
              ),
            ),
            // COnfirm password

            SizedBox(height: 15),
            TextFormField(
              controller: _birthdayController,
              decoration: InputDecoration(
                prefixIcon: Icon(FontAwesomeIcons.birthdayCake),
                hintText: ' MM/DD/YYYY',
              ),
            ),

            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Builder(
                  builder: (context) => RaisedButton(
                      color: Colors.orange[400],
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        final FirebaseUser user = await _auth.currentUser();
                        if (_birthdayController.text != '' &&
                            _mobilePhoneController.text != '') {
                          //  setState(() => loading = true);
                          Firestore.instance
                              .collection('users')
                              .document('${user.uid}')
                              .setData({
                            "firstName": _firstNameController.text,
                            "lastName": _lastNameController.text,
                            "email": _emailController.text,
                            "phoneNumber": _mobilePhoneController.text,
                            "birthday": _birthdayController.text
                          });
                        } else {
                          //  setState(() => loading = true);

                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please enter the fields"),
                              duration: Duration(seconds: 10),
                            ),
                          );
                        }
                      }
                      //setState(() => loading = false);
                      ),
                ),
                RaisedButton(
                    color: Colors.orange[400],
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
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
              text: 'gm',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'one',
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
                    // _loginAccountLabel(),
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
