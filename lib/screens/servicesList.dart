import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../constants.dart';

class ServiceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
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
              title: Text('Emergency Staff Loan'),
              subtitle: Text('Being there for our staff'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('horse');
              },
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.home,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Staff Morgage Loan'),
              subtitle: Text('Be home owner'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('cow');
              },
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.car,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Automobile Loan'),
              subtitle: Text('Live with Comfort'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('camel');
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.officeBuilding,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Condominum Loan'),
              subtitle: Text('Own your Space'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('sheep');
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.chartBar,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Micro Loans'),
              subtitle: Text('Money for what Matters'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('goat');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.group,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Personal Loans'),
              subtitle: Text('Family Matters'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('goat');
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
              subtitle: Text('Be home owner'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('cow');
              },
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.car,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Automobile Insurance'),
              subtitle: Text('Live with Comfort'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('camel');
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.officeBuilding,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Business Insurance'),
              subtitle: Text('Your Business is your future'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('sheep');
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.chartBar,
                color: Colors.blue[900],
                size: 44,
              ),
              title: Text('Life Insurance'),
              subtitle: Text('Protect you loved ones'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('goat');
              },
            ),
          ],
        ),
      ),
    );
  }
}
