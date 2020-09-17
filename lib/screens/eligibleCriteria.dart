import 'package:flutter/material.dart';
import 'package:ligmone/loginScreen/loginPage.dart';
import 'package:ligmone/size_config.dart';

import '../constants.dart';

class EligibleCriteria extends StatefulWidget {
  EligibleCriteria({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EligibleCriteriaState createState() => _EligibleCriteriaState();
}

class _EligibleCriteriaState extends State<EligibleCriteria> {
  List<String> revolvingEmergencyStaffLoan = [
    "Revolving Emergency Staff Loan(RESL) Eligiblity Criteria",
    "Permanent employee of the bank with minimum of one year service",
    "The amount of loan shall be determined based on years of experience and Salary",
    "Years Served = 1<=x<2, RESL limit = 2-months' salary, Repayment Period= 12 months",
    "Years Served = 2<=x<3, RESL limit = 3-months' salary, Repayment Period= 18 months",
    "Years Served = 3<=x<4, RESL limit = 4-months' salary, Repayment Period= 24 months",
    "Years Served = X>=4, RESL limit = 6-months' salary, Repayment Period= 36 months",
  ];
  List<String> staffMorgageLoan = [
    "Staff Morgage Eligiblity Criteria",
    "Permanent employee of the bank with minimum of two year services",
    "The applicant shall have good employment record",
    "Total debt payment obligations shall not eceed half of applicant's base monthly salary",
    "The resident house acquired need to in the town of where Bank branch exist",
    "Applicant shall contribute at least 5% of the cost of residential house",
    "Fresh Morgage loan request shall be considered upon his/her salary and his/her spouse income plus equity contribution ",
    "Expand more...",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> temp = [];
    switch (widget.title) {
      case 'Emergency Staff Loan':
        temp = revolvingEmergencyStaffLoan;
        break;
      case 'Staff Morgage Loan':
        temp = staffMorgageLoan;
        break;
      case 'Automobile Loans':
        temp = revolvingEmergencyStaffLoan;
        break;
      case 'Staff Condominum Loans':
        temp = revolvingEmergencyStaffLoan;
        break;
      case 'Micro Loans':
        temp = revolvingEmergencyStaffLoan;
        break;
      case 'Personal Loans':
        temp = revolvingEmergencyStaffLoan;
        break;
      case 'Shopping Loans':
        temp = revolvingEmergencyStaffLoan;
        break;
      default:
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
        title: Text(widget.title),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'Loan Services',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(revolvingEmergencyStaffLoan[0]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(revolvingEmergencyStaffLoan[1]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(revolvingEmergencyStaffLoan[2]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(revolvingEmergencyStaffLoan[3]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(revolvingEmergencyStaffLoan[4]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(revolvingEmergencyStaffLoan[5]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(revolvingEmergencyStaffLoan[6]),
              subtitle: Text('Being there for our staff'),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            width: double.infinity,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                'Apply Now',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                ),
              ),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                ),
              },
              color: kPrimaryColor,
              textColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
