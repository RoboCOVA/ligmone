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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              title: Text('Emergency Staff Loan'),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Emergency Staff Loan'),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Emergency Staff Loan'),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Emergency Staff Loan'),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Emergency Staff Loan'),
              subtitle: Text('Being there for our staff'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Emergency Staff Loan'),
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
