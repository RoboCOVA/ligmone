import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ligmone/screens/eligibleCriteria.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../constants.dart';

class ServiceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appbarcolor,
          title: Text('Eligibility Requirements'),
        ),
        body: ListView(
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
              title: Text('Emergency Staff Loans'),
              // subtitle: Text('Being there for our staff'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EligibleCriteria(title: 'Emergency Staff Loan'),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.home,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Staff Morgage Loans'),
              //subtitle: Text('Be home owner'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EligibleCriteria(title: 'Staff Morgage Loan'),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.car,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Automobile Loas'),
              // subtitle: Text('Live with Comfort'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EligibleCriteria(title: 'Automobile Loans'),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.officeBuilding,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Condominum Loans'),
              //  subtitle: Text('Own your Space'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EligibleCriteria(title: 'Staff Condominum Loans'),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.chartBar,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Micro Loans'),
              // subtitle: Text('Money for what Matters'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EligibleCriteria(title: 'Micro Loans'),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.group,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Personal Loans'),
              // subtitle: Text('Family Matters'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EligibleCriteria(title: 'Personal Loans'),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.group,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Shopping Loans'),
              //  subtitle: Text('When you need it'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EligibleCriteria(title: 'Shopping Loans'),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Insurance',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26),
              ),
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.home,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Morgage Insurance'),
              //  subtitle: Text('Be home owner'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EligibleCriteria(title: 'Morgage Insurance'),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.car,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Automobile Insurance'),
              //   subtitle: Text('Live with Comfort'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EligibleCriteria(title: 'Automobile Insurance'),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.officeBuilding,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Business Insurance'),
              // subtitle: Text('Your Business is your future'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EligibleCriteria(title: 'Business Insurance'),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.chartBar,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Life Insurance'),
              //   subtitle: Text('Protect you loved ones'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EligibleCriteria(title: 'Life Insurance'),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Merchant Services',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26),
              ),
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.home,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Merchant Services'),
              //  subtitle: Text('Pay on the Go'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EligibleCriteria(title: 'Merchant Services'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
