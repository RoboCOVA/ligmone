import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoansPage extends StatefulWidget {
  @override
  _LoansPageState createState() => _LoansPageState();
}

class _LoansPageState extends State<LoansPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFEFEFE),
      appBar: AppBar(
        title: const Text('Ligmone Products'),
      ),
      body: Column(
        // padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        children: <Widget>[
          _introCard(),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) => EntryItem(
                data[index],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _introCard() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.all(16),
      height: 160,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.2),
              offset: Offset(0, 3),
              spreadRadius: 5,
              blurRadius: 5,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Select Your Best options',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Money Is not an Issue\n Together',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Explore',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 19,
                ),
              ),
              SizedBox(width: 8),
              Icon(FontAwesomeIcons.longArrowAltRight,
                  size: 36, color: Colors.white),
            ],
          )
        ],
      ),
    );
  }
}

// Welcome to another flutter tutorial
// In this video we will see how to create a multi-level Expansion List
// First Let's create a class for each row in the Expansion List

class Entry {
  final String title;
  final List<Entry>
      children; // Since this is an expansion list ...children can be another list of entries
  Entry(this.title, [this.children = const <Entry>[]]);
}

// This is the entire multi-level list displayed by this app
final List<Entry> data = <Entry>[
  Entry(
    'Shopping Loans',
    <Entry>[
      Entry(
        'Below 25,000.00 birr',
        // <Entry>[
        //   Entry('Item A0.1'),
        //   Entry('Item A0.2'),
        //   Entry('Item A0.3'),
        // ],
      ),
      Entry('From 25,000 to 50,000 Birr'),
      Entry('From 50,000 to 100,000 Birr'),
      Entry('Above 100,000 Birr Contact Us'),
    ],
  ),
  // Second Row
  Entry('Micro Loans', <Entry>[
    Entry('Small business Loans'),
    Entry('Medical refinancing'),
    Entry('start Student Loans'),
    Entry('Start Parent Loans'),
  ]),
  Entry(
    'Staff Loans',
    <Entry>[
      Entry('Condominium Loans'),
      Entry('Collateral Loans'),
      Entry(
        'Micro Loans',
        <Entry>[
          Entry('Personal Loans'),
          Entry('Shopping Loans'),
          Entry('Auto Loans'),
          Entry('Student Loans'),
        ],
      )
    ],
  ),

  Entry('Buy Home or Refinance', <Entry>[
    Entry('Exclusive member Discount'),
    Entry('Affordable down payment'),
    Entry('Residential Building'),
    Entry('Home Improvement'),
  ]),
];

// Create the Widget for the row
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  // This function recursively creates the multi-level list rows.
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(
          root.title,
          style: TextStyle(fontFamily: 'Roboto'),
        ),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(
        root.title,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
