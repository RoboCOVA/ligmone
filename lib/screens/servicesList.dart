import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

String horseUrl = 'https://i.stack.imgur.com/Dw6f7.png';
String cowUrl = 'https://i.stack.imgur.com/XPOr3.png';
String camelUrl = 'https://i.stack.imgur.com/YN0m7.png';
String sheepUrl = 'https://i.stack.imgur.com/wKzo8.png';
String goatUrl = 'https://i.stack.imgur.com/Qt4JP.png';

class ServiceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            leading: Icon(Icons.access_alarm),
            title: Text('Emergency Staff Loan'),
            subtitle: Text('Being there for our staff'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print('horse');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.home),
            title: Text('Staff Morgage Loan'),
            subtitle: Text('Be home owner'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print('cow');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.car),
            title: Text('Automobile Loan'),
            subtitle: Text('Live with Comfort'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print('camel');
            },
            enabled: false,
          ),
          ListTile(
            leading: Icon(MdiIcons.officeBuilding),
            title: Text('Condominum Loan'),
            subtitle: Text('Own your Space'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print('sheep');
            },
          ),
          ListTile(
            leading: Icon(MdiIcons.chartBar),
            title: Text('Micro Loans'),
            subtitle: Text('Money for what Matters'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print('goat');
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
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
            leading: Icon(FontAwesomeIcons.home),
            title: Text('Morgage Insurance'),
            subtitle: Text('Be home owner'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print('cow');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.car),
            title: Text('Automobile Insurance'),
            subtitle: Text('Live with Comfort'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print('camel');
            },
            enabled: false,
          ),
          ListTile(
            leading: Icon(MdiIcons.officeBuilding),
            title: Text('Condominum Loan'),
            subtitle: Text('Own your Space'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print('sheep');
            },
          ),
          ListTile(
            leading: Icon(MdiIcons.chartBar),
            title: Text('Micro Loans'),
            subtitle: Text('Money for what Matters'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print('goat');
            },
          ),
        ],
      ),
    );
  }
}
