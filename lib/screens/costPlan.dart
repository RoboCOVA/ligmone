import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ligmone/homePage.dart';
import 'package:ligmone/loginScreen/applicationForm.dart';
import 'package:ligmone/screens/bottomNavigation.dart';

class CostPlan extends StatefulWidget {
  @override
  _CostPlanState createState() => _CostPlanState();
}

class _CostPlanState extends State<CostPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFEFEFE),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            ),
            onPressed: () => {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavigationMenu(),
                    ),
                    (route) => false,
                  ),
                }),
        title: Text("Plans"),
        actions: <Widget>[
          IconButton(icon: Icon(FontAwesomeIcons.coins), onPressed: () {}),
          IconButton(
              icon: Icon(FontAwesomeIcons.ellipsisV),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 60.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [Color(0xff8d70fe), Color(0xff2da9ef)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -1.0)), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Text(
                                'Standard Plan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          //subText
                          Container(
                            child: Text(
                              'This is standard plan',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          //Circle Avatar
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                                width: 150.0,
                                height: 130.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        '5.99%',
                                        style: TextStyle(
                                          fontSize: 30.0,
                                          color: Color(0xff8d70fe),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '/month',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Color(0xff8d70fe),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),

                          //Two Column Table
                          DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(''),
                              ),
                              DataColumn(
                                label: Text(''),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  myRowDataIcon(
                                      FontAwesomeIcons.database, "Amount"),
                                ),
                                DataCell(
                                  Text(
                                    '<25,000\nETB',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  myRowDataIcon(
                                      FontAwesomeIcons.users, "FTP users"),
                                ),
                                DataCell(
                                  Text(
                                    '50',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  myRowDataIcon(FontAwesomeIcons.folderOpen,
                                      "Adons Services"),
                                ),
                                DataCell(
                                  Text(
                                    '5',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  myRowDataIcon(
                                      FontAwesomeIcons.phone, "24/7 Support"),
                                ),
                                DataCell(
                                  Text(
                                    'Yes',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  myRowDataIcon(FontAwesomeIcons.envelope,
                                      "Custom Insurance"),
                                ),
                                DataCell(
                                  Text(
                                    '50',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),

                          //Button
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: RaisedButton(
                                color: new Color(0xffffffff),
                                child: Text(
                                  'Choose Plan',
                                  style: TextStyle(
                                    color: new Color(0xff6200ee),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ApplicationForm(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //Second ListView
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [Color(0xffebac38), Color(0xffde4d2a)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -2.0)), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Icon(
                                              FontAwesomeIcons.dropbox,
                                              color: new Color(0xffffffff),
                                              size: 40.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            'Plus',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Text(
                                              '8.99%\n/month',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Two Column Table
                          DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(
                                  'Storage',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  '1TB',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Smart synchronization',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.times,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Full text search',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.times,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Folders without connection',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.check,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Uploads from camera',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.check,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Scanning of documents',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.check,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    '24/7 Support',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.times,
                                    color: Colors.white54,
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Text(
                                    'Custom Email',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Icon(FontAwesomeIcons.check,
                                      color: new Color(0xffffffff)),
                                ),
                              ]),
                            ],
                          ),

                          //Button
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                                color: new Color(0xffffffff),
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                    color: new Color(0xffde4d2a),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ApplicationForm(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //Third ListView
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [Color(0xffcb3a57), Color(0xffcb3a57)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -1.0)), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Icon(
                                              FontAwesomeIcons.soundcloud,
                                              color: new Color(0xffffffff),
                                              size: 40.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Text(
                                              'Flex',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Text(
                                              '10.99%\n/month',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Two Column Table
                          DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(''),
                              ),
                              DataColumn(
                                label: Text(''),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.check,
                                    color: Colors.white,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    'Smart synchronization',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.check,
                                    color: Colors.white,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    'Full text search',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Icon(FontAwesomeIcons.check,
                                      color: new Color(0xffffffff)),
                                ),
                                DataCell(
                                  Text(
                                    'Folders without connection',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Icon(FontAwesomeIcons.check,
                                      color: new Color(0xffffffff)),
                                ),
                                DataCell(
                                  Text(
                                    'Uploads from camera',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Icon(FontAwesomeIcons.check,
                                      color: new Color(0xffffffff)),
                                ),
                                DataCell(
                                  Text(
                                    'Scanning of documents',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Icon(
                                    FontAwesomeIcons.times,
                                    color: Colors.white54,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    '24/7 Support',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Icon(FontAwesomeIcons.check,
                                      color: new Color(0xffffffff)),
                                ),
                                DataCell(
                                  Text(
                                    'Custom Email',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),

                          //Button
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                                color: new Color(0xffffffff),
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                    color: new Color(0xffcb3a57),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ApplicationForm(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )),
                          ),
                        ],
                      ),
                    ],
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

ListTile myRowDataIcon(IconData iconVal, String rowVal) {
  return ListTile(
    leading: Icon(iconVal, color: new Color(0xffffffff)),
    title: Text(
      rowVal,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
