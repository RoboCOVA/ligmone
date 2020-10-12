import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ligmone/screens/costPlan.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:ligmone/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String title = 'Welcome to Ligmone';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerNickname;

  SharedPreferences prefs;

  String id = '';
  String nickname = '';
  String aboutMe = '';
  String photoUrl = '';

  bool isLoading = false;

  final FocusNode focusNodeNickname = FocusNode();

  @override
  void initState() {
    super.initState();
    readLocal();
  }

  void readLocal() async {
    prefs = await SharedPreferences.getInstance();
    nickname = prefs.getString('nickname') ?? '';

    controllerNickname = TextEditingController(text: nickname);

    // Force refresh input
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Welcome to Ligmone'),
      // ),
      backgroundColor: Color(0XFFFEFEFE),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, top: 54, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _greetings(),
                _trailingIcons(),
              ],
            ),
            SizedBox(height: 24),
            _introCard(),
            _title('Products and Services'),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _menuItem('Shopping \nLoan', FontAwesomeIcons.dollarSign,
                    blueGradient),
                _menuItem('Staff\nLoan', Icons.work, darkRedGradient),
                _menuItem(' Micro \n Loans', FontAwesomeIcons.solidMoneyBillAlt,
                    tealGradient),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _menuItem('Diaspora\n Account', FontAwesomeIcons.diaspora,
                    yellowGradient),
                _menuItem(
                    'Insurance\nServices', FontAwesomeIcons.gift, redGradient),
                _menuItem(
                    'Transfer\nYour Loan', Icons.account_box, purpleGradient),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _menuItem('Invite new \nborrower', FontAwesomeIcons.coins,
                    yellowGradient),
                _menuItem('Personal\nLoan', FontAwesomeIcons.personBooth,
                    redGradient),
                _menuItem('Merchant \nServices',
                    FontAwesomeIcons.solidCreditCard, purpleGradient),
              ],
            ),
            SizedBox(height: 12),
            _title('Special Pomotion'),
            SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _promotionCard(
                    'Loans...\n Refer Ligmone Loans. Make Money. Earn 300ETB\n When firends get a ligmone Personal Loan or Shopping Loan.\n They will get 300 ETB too!',
                    'assets/profit.png'),
                SizedBox(
                  height: 10,
                ),
                _promotionCard(
                    'Member Benefits...\nGet support for tackling money problems\n with your partner. There are alot of way to achieve your goals and needs\nGet help from our Financiers\n Make an an Appointment!',
                    'assets/cash-back.png'),
                SizedBox(
                  height: 10,
                ),
                _promotionCard(
                    'Member Experience...\nNo Stress with Ligmone \n Over 2,000 memebers registered for Webinar and virtual advice \n attend member event from anywhere!',
                    'assets/experience.png'),
                SizedBox(
                  height: 10,
                ),
                _promotionCard(
                    'Ligmone Blog...\nSaturday Shoppings, Tips and News!\nLearn more about Money and Finance, lEARN to Control!',
                    'assets/financecontrol.jpg'),
              ],
            ),
            SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  _promotionCard(String title, String assetUrl) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 110,
          //width: MediaQuery.of(context).size.width / 2 - 30,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(0XFFDDFF3FF),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 2,
                )
              ]),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 1, minHeight: 1), // here
                child: Image.asset(
                  assetUrl,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w800,
            fontSize: 14,
          ),
        )
      ],
    );
  }

  _menuItem(String title, IconData iconData, LinearGradient gradient) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.35,
      width: MediaQuery.of(context).size.width * 0.26,
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            child: Container(
              padding: EdgeInsets.all(18),
              child: Center(
                child: Icon(iconData, size: 24, color: Colors.white),
              ),
              decoration: BoxDecoration(
                gradient: gradient,
                shape: BoxShape.circle,
              ),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => CostPlan(),
                ),
                (route) => false,
              );
            },
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  _title(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.blueGrey[900],
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
            'Online Loan Advance',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Fast,easy,secure \nlow prime rate.',
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

  _greetings() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Hello !',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4),
        Text(
          nickname,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  _trailingIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(FontAwesomeIcons.fire, size: 24, color: Colors.blueGrey[700]),
        SizedBox(width: 12),
        Icon(FontAwesomeIcons.bell, size: 24, color: Colors.blueGrey[700]),
      ],
    );
  }
}
