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
  ];
  List<String> staffAutomobileLoan = [
    "Applicant shall be a permanent employee who served the bank forat least three years",
    "Good employment reputation record/no discplinary issues",
    "The applicant's total monthly debt payment shall not be more than half of applicant's basic monthly salary",
    "The applicant shall deposit required equity contribution in the bank branch where loan is applied for approval",
    "The applicant shall submit pro forma invoice from vendor/dealer or manufacturer",
    "Credit request shall be maintained at the branch where applicant sallary account is",
    "Applicant staff shall present marriage certificate if married",
  ];
  List<String> staffCondominiumLoan = [
    "The individual shall be selected by the Addis Ababa City Government or Regional States",
    "The applicant shall submit the standard loan application form",
    "The applicant shall provide Indentification Card, Letter from City Administration",
    "Evidence of marital status or marriage certificate",
    "Advance payment receipt and sales contract signed",
    "Saving account opened at Braches or Consumer Loan CPC",
  ];
  List<String> microLoan = [
    "Small business owner or salaried employee with proof of consistent income",
    "Permanent employee of the bank with minimum of one year service",
    "The amount of loan shall be determined based on years of experience and consistency of income",
    "For  business owner, it is required to provide financial statement: Income statment, Blanace sheet, and Cash flow statement",
    "For the family purpose, at least one of the family members has to have consistent income for the last six months",
  ];
  List<String> personalLoan = [
    "Letter from employer confirming employment status and duration, monthly basic salary",
    "Proof of identity Card driving license, passport or employment identity card",
    "Two passport size photographs",
    "Latest salary paystubs",
    "Latest Income Tax return if applicable",
  ];
  List<String> shoppingLoan = [
    "The shopper should have card with the bank",
    "The first time buyer gets discount on interest",
    "The bank shall provide the credit limit to the shopper depending on his/her Income",
    "The merchant must registered merchant with bank via our service",
    "The amount of high ticket purchase and the duration to pay back will be predetermined",
    "Based on creditworthiness, the limit gets decided by the bank",
    "Interest rate depends on the amount, duration and credit",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget temp;
    switch (widget.title) {
      case 'Emergency Staff Loan':
        temp = _buildBodyEmergency();
        break;
      case 'Staff Morgage Loan':
        temp = _buildBodystaffMorgage();
        break;
      case 'Automobile Loans':
        temp = _buildBodyAutomobile();
        break;
      case 'Staff Condominum Loans':
        temp = _buildBodyStaffCondominum();
        break;
      case 'Micro Loans':
        temp = _buildBodyMicroLoan();
        break;
      case 'Personal Loans':
        temp = _buildBodyPersonalLoan();
        break;
      case 'Shopping Loans':
        temp = _buildBodyShoppingLoan();
        break;
      default:
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
        title: Text(widget.title),
      ),
      body: temp,
    );
  }

  Widget _buildBodyEmergency() {
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
              //  subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(revolvingEmergencyStaffLoan[1]),
              //subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(revolvingEmergencyStaffLoan[2]),
              // subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(revolvingEmergencyStaffLoan[3]),
              //  subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(revolvingEmergencyStaffLoan[4]),
              //  subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(revolvingEmergencyStaffLoan[5]),
              //  subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(revolvingEmergencyStaffLoan[6]),
              //  subtitle: Text('Being there for our staff'),
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

  Widget _buildBodystaffMorgage() {
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
              title: Text(staffMorgageLoan[0]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffMorgageLoan[1]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffMorgageLoan[2]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffMorgageLoan[3]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffMorgageLoan[4]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffMorgageLoan[5]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffMorgageLoan[6]),
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

  Widget _buildBodyStaffCondominum() {
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
              title: Text(staffCondominiumLoan[0]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffCondominiumLoan[1]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffCondominiumLoan[2]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffCondominiumLoan[3]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffCondominiumLoan[4]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffCondominiumLoan[5]),
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

  Widget _buildBodyAutomobile() {
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
              title: Text(staffAutomobileLoan[0]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffAutomobileLoan[1]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffAutomobileLoan[2]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffAutomobileLoan[3]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffAutomobileLoan[4]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffAutomobileLoan[5]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(staffAutomobileLoan[6]),
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

  Widget _buildBodyMicroLoan() {
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
              title: Text(microLoan[0]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(microLoan[1]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(microLoan[2]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(microLoan[3]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(microLoan[4]),
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

  Widget _buildBodyPersonalLoan() {
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
              title: Text(personalLoan[0]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(personalLoan[1]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(personalLoan[2]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(personalLoan[3]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(personalLoan[4]),
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

  Widget _buildBodyShoppingLoan() {
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
              title: Text(shoppingLoan[0]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(shoppingLoan[1]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(shoppingLoan[2]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(shoppingLoan[3]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(shoppingLoan[4]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(shoppingLoan[5]),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text(shoppingLoan[6]),
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
