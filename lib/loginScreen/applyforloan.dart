import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ligmone/screens/bottomNavigation.dart';
import 'package:ligmone/screens/whyLigmone.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../homePage.dart';

class ApplyLoan extends StatefulWidget {
  @override
  _ApplyLoanState createState() => _ApplyLoanState();
}

class _ApplyLoanState extends State<ApplyLoan> {
  // personal information
  TextEditingController _personlController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _marriageController = TextEditingController();
  TextEditingController _birthdayController = TextEditingController();
  TextEditingController _mobilePhoneController = TextEditingController();

  // Professional life
  TextEditingController _educationController = TextEditingController();
  TextEditingController _professionController = TextEditingController();
  TextEditingController _employeeController = TextEditingController();
  TextEditingController _yearlyincome = TextEditingController();

// Loan Information
  TextEditingController _loanAmout = TextEditingController();
  TextEditingController _chooseLoanTerms = TextEditingController();
  TextEditingController _loanreasonController = TextEditingController();
  TextEditingController _collateraAsset = TextEditingController();

  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  SharedPreferences prefs;

  String id = '';

  bool isLoading = false;

  final FocusNode focusNodeNickname = FocusNode();

  void readLocal() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id') ?? '';

    // Force refresh input
    setState(() {});
  }

  Future myFuture;
  @override
  void initState() {
    super.initState();
    readLocal();

    // assign this variable your Future
    myFuture = getFuture();
  }

  Future<User> getFuture() async {
    return _auth.currentUser;
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
            SizedBox(height: 20),
            Text(
              'Loan Information',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            SizedBox(height: 10),
            //Loan Amount
            TextFormField(
              controller: _loanAmout,
              decoration: InputDecoration(
                //prefixIcon: Icon(Icons.person_outline),
                hintText: 'Loan Amount',
              ),
            ),
            //Choose Laon Terms
            SizedBox(height: 15),
            TextFormField(
              controller: _chooseLoanTerms,
              decoration: InputDecoration(
                // prefixIcon: Icon(Icons.person_outline),
                hintText: 'Loan terms, 3,6,12 months',
              ),
            ),

            //Loan reason
            SizedBox(height: 15),
            TextFormField(
              controller: _loanreasonController,
              decoration: InputDecoration(
                //  prefixIcon: Icon(Icons.alternate_email),
                hintText: 'Loan Reason; home appliance, wedding, ceremony,etc',
              ),
            ),

            //Loan Collateral Asset
            SizedBox(height: 15),
            TextFormField(
              controller: _collateraAsset,
              decoration: InputDecoration(
                //  prefixIcon: Icon(Icons.alternate_email),
                hintText: 'Collateral Asset, house, auto',
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Personal Information',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            //FirstName and lastName
            SizedBox(height: 20),
            TextFormField(
              controller: _personlController,
              decoration: InputDecoration(
                //  prefixIcon: Icon(Icons.person_outline),
                hintText: 'FirstName LastName',
              ),
            ),
            //Gender
            SizedBox(height: 15),
            TextFormField(
              controller: _genderController,
              decoration: InputDecoration(
                //  prefixIcon: Icon(Icons.person_outline),
                hintText: 'Gender, male, female',
              ),
            ),

            //Marriage
            SizedBox(height: 15),
            TextFormField(
              controller: _marriageController,
              decoration: InputDecoration(
                //  prefixIcon: Icon(Icons.alternate_email),
                hintText: 'Marriage, single,marrried',
              ),
            ),
            //Phone Number
            SizedBox(height: 15),
            TextFormField(
              controller: _mobilePhoneController,
              decoration: InputDecoration(
                // prefixIcon: Icon(FontAwesomeIcons.phone),
                hintText: 'phone number',
              ),
            ),

            //Birthdate

            SizedBox(height: 15),
            TextFormField(
              controller: _birthdayController,
              decoration: InputDecoration(
                // prefixIcon: Icon(FontAwesomeIcons.birthdayCake),
                hintText: ' MM/DD/YYYY',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Professional Background',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            //educational and professional background

            //Educational background
            SizedBox(height: 15),
            TextFormField(
              controller: _educationController,
              decoration: InputDecoration(
                //   prefixIcon: Icon(Icons.person_outline),
                hintText: 'Educational background -Diploma, Bsc. , Msc, PHD',
              ),
            ),

            //Professional background
            SizedBox(height: 15),
            TextFormField(
              controller: _professionController,
              decoration: InputDecoration(
                // prefixIcon: Icon(Icons.alternate_email),
                hintText: 'Your profession-Teacher, Nurse, doctor,etc',
              ),
            ),
            //Your Employee
            SizedBox(height: 15),
            TextFormField(
              controller: _employeeController,
              decoration: InputDecoration(
                //   prefixIcon: Icon(FontAwesomeIcons.phone),
                hintText: 'Employer',
              ),
            ),

            //Yearly Income
            SizedBox(height: 15),
            TextFormField(
              controller: _yearlyincome,
              decoration: InputDecoration(
                //  prefixIcon: Icon(FontAwesomeIcons.birthdayCake),
                hintText: ' Your yearly Income',
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
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        User user = _auth.currentUser;
                        if (_personlController.text != '' &&
                            _loanAmout.text != '') {
                          //  setState(() => loading = true);
                          FirebaseFirestore.instance
                              .collection('application')
                              .doc('${user.uid}')
                              .set({
                            "laonamount": _loanAmout.text,
                            "loanterms": _chooseLoanTerms.text,
                            "loanreason": _loanreasonController.text,
                            "collateralasset": _collateraAsset.text,
                            "name": _personlController.text,
                            "gender": _genderController.text,
                            "marriage": _marriageController.text,
                            "birthdate": _birthdayController.text,
                            "mobilephone": _mobilePhoneController.text,
                            "education": _educationController.text,
                            "profession": _professionController.text,
                            "Employer": _employeeController.text,
                            "Income": _yearlyincome.text
                          });

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WhyLigmone(),
                                //BottomNavigationMenu(currentUserId: id),
                              ));
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Material Dialog"),
              content: new Text("Hey! I'm Coflutter!"),
              actions: <Widget>[
                FlatButton(
                  child: Text('Close me!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Li',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
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
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            ),
            onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BottomNavigationMenu(currentUserId: id),
                      )),
                }),
        title: Text("Plans"),
        actions: <Widget>[
          // IconButton(icon: Icon(FontAwesomeIcons.coins), onPressed: () {}),
          IconButton(
              icon: Icon(FontAwesomeIcons.ellipsisV),
              onPressed: () {
                Navigator.of(context);
              }),
        ],
      ),
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
                  ],
                ),
              ),
            ),
            // Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
