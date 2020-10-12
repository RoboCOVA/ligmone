import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ligmone/loginScreen/signup.dart';
import 'package:ligmone/screens/bottomNavigation.dart';
import 'package:ligmone/services/authService.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ForgotPassword.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum LoginType {
  email,
  google,
  facebook,
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences prefs;

  bool isLoading = false;
  bool isLoggedIn = false;
  User currentUser;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    this.setState(() {
      isLoading = true;
    });

    prefs = await SharedPreferences.getInstance();

    isLoggedIn = await googleSignIn.isSignedIn();
    if (isLoggedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                BottomNavigationMenu(currentUserId: prefs.getString('id'))),
      );
    }

    this.setState(() {
      isLoading = false;
    });
  }

  void _loginUser(
      {@required LoginType type,
      String email,
      String password,
      BuildContext context}) async {
    AuthService _currentUser = Provider.of<AuthService>(context, listen: false);
    this.setState(() {
      isLoading = true;
    });
    prefs = await SharedPreferences.getInstance();

    try {
      String _returnString;
      switch (type) {
        case LoginType.email:
          _returnString =
              await _currentUser.loginUserWithEmail(email, password);
          break;
        case LoginType.google:
          _returnString = await _currentUser.loginUserWithGoogle();
          break;
        case LoginType.facebook:
          _returnString = await _currentUser.loginUserWithFacebook();
          print(_returnString);
          break;
        default:
      }

      if (_returnString == "success") {
        // await prefs.setString('accoutCreated',_user.accountCreated);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BottomNavigationMenu(currentUserId: prefs.getString('id')),
          ),
          (route) => false,
        );
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(_returnString),
            duration: Duration(seconds: 10),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  // Login with facebook

  Widget _facebookButton() {
    return Container(
      child: RaisedButton(
        color: Color(0XFF3b5998),
        onPressed: handleSignInFB,
        //onPressed: () {
        // _loginUser(type: LoginType.facebook, context: context);

        //  },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage("assets/facebook-logo.png"), height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Log in with Facebook',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Login with Google

  Widget _googleButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13),
      alignment: Alignment.center,
      child: RaisedButton(
        color: Color(0XFFFFFFFF),
        onPressed: handleSignIn,
        // onPressed: () {

        //   _loginUser(type: LoginType.google, context: context);
        // },
        highlightElevation: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("assets/google_logo.png"), height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
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

  Future<Null> handleSignInEmail(
      String email, String password, String firstName, String lastName) async {
    prefs = await SharedPreferences.getInstance();
    UserCredential userResult;
    this.setState(() {
      isLoading = true;
    });
    try {
      UserCredential credential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser = firebaseAuth.currentUser;
      if (firebaseUser != null) {
        // Check is already sign up
        final QuerySnapshot result = await FirebaseFirestore.instance
            .collection('users1')
            .where('id', isEqualTo: firebaseUser.uid)
            .get();
        final List<DocumentSnapshot> documents = result.docs;
        if (documents.length == 0) {
          // Update data to server if new user
          FirebaseFirestore.instance
              .collection('users1')
              .doc(firebaseUser.uid)
              .set({
            'nickname': firebaseUser.displayName,
            'photoUrl': firebaseUser.photoURL,
            'id': firebaseUser.uid,
            'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
            'chattingWith': null
          });

          // Write data to local
          currentUser = firebaseUser;
          await prefs.setString('id', currentUser.uid);
          await prefs.setString('nickname', currentUser.displayName);
          await prefs.setString('photoUrl', currentUser.photoURL);
        } else {
          // Write data to local
          await prefs.setString('id', documents[0].data()['id']);
          await prefs.setString('nickname', documents[0].data()['nickname']);
          await prefs.setString('photoUrl', documents[0].data()['photoUrl']);
          await prefs.setString('aboutMe', documents[0].data()['aboutMe']);
        }
        Fluttertoast.showToast(msg: "Sign in success");
        this.setState(() {
          isLoading = false;
        });

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BottomNavigationMenu(currentUserId: firebaseUser.uid),
            ));
      } else {
        Fluttertoast.showToast(msg: "Sign in fail");
        this.setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Null> handleSignInFB() async {
    prefs = await SharedPreferences.getInstance();
    UserCredential userResult;
    this.setState(() {
      isLoading = true;
    });
    try {
      final facebookLogin = FacebookLogin();
      FacebookLoginResult result = await facebookLogin.logIn(['email']);
      FacebookAccessToken facebookAccessToken = result.accessToken;
      if (result.status == FacebookLoginStatus.loggedIn) {
        AuthCredential credential =
            FacebookAuthProvider.credential(facebookAccessToken.token);
        userResult = (await firebaseAuth.signInWithCredential(credential));

        // final resultInfo = await facebookLogin.logInWithReadPermissions(['email']);
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');
        //final profile = json.decode(graphResponse.body);
        Map<String, dynamic> profile = json.decode(graphResponse.body);

        User firebaseUser =
            (await firebaseAuth.signInWithCredential(credential)).user;
        if (firebaseUser != null) {
          // Check is already sign up
          final QuerySnapshot result = await FirebaseFirestore.instance
              .collection('users1')
              .where('id', isEqualTo: firebaseUser.uid)
              .get();
          final List<DocumentSnapshot> documents = result.docs;
          if (documents.length == 0) {
            // Update data to server if new user
            FirebaseFirestore.instance
                .collection('users1')
                .doc(firebaseUser.uid)
                .set({
              'nickname': firebaseUser.displayName,
              'photoUrl': firebaseUser.photoURL,
              'id': firebaseUser.uid,
              'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
              'chattingWith': null
            });

            // Write data to local
            currentUser = firebaseUser;
            await prefs.setString('id', currentUser.uid);
            await prefs.setString('nickname', currentUser.displayName);
            await prefs.setString('photoUrl', currentUser.photoURL);
          } else {
            // Write data to local
            await prefs.setString('id', documents[0].data()['id']);
            await prefs.setString('nickname', documents[0].data()['nickname']);
            await prefs.setString('photoUrl', documents[0].data()['photoUrl']);
            await prefs.setString('aboutMe', documents[0].data()['aboutMe']);
          }
          Fluttertoast.showToast(msg: "Sign in success");
          this.setState(() {
            isLoading = false;
          });

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    BottomNavigationMenu(currentUserId: firebaseUser.uid),
              ));
        } else {
          Fluttertoast.showToast(msg: "Sign in fail");
          this.setState(() {
            isLoading = false;
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Null> handleSignIn() async {
    prefs = await SharedPreferences.getInstance();

    this.setState(() {
      isLoading = true;
    });
    try {
      GoogleSignInAccount googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      User firebaseUser =
          (await firebaseAuth.signInWithCredential(credential)).user;

      if (firebaseUser != null) {
        // Check is already sign up
        final QuerySnapshot result = await FirebaseFirestore.instance
            .collection('users1')
            .where('id', isEqualTo: firebaseUser.uid)
            .get();
        final List<DocumentSnapshot> documents = result.docs;
        if (documents.length == 0) {
          // Update data to server if new user
          FirebaseFirestore.instance
              .collection('users1')
              .doc(firebaseUser.uid)
              .set({
            'nickname': firebaseUser.displayName,
            'photoUrl': firebaseUser.photoURL,
            'id': firebaseUser.uid,
            'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
            'chattingWith': null
          });

          // Write data to local
          currentUser = firebaseUser;
          await prefs.setString('id', currentUser.uid);
          await prefs.setString('nickname', currentUser.displayName);
          await prefs.setString('photoUrl', currentUser.photoURL);
        } else {
          // Write data to local
          await prefs.setString('id', documents[0].data()['id']);
          await prefs.setString('nickname', documents[0].data()['nickname']);
          await prefs.setString('photoUrl', documents[0].data()['photoUrl']);
          await prefs.setString('aboutMe', documents[0].data()['aboutMe']);
        }
        Fluttertoast.showToast(msg: "Sign in success");
        this.setState(() {
          isLoading = false;
        });

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BottomNavigationMenu(currentUserId: firebaseUser.uid),
            ));
      } else {
        Fluttertoast.showToast(msg: "Sign in fail");
        this.setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Widget _submitButtonnew() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      child: Form(
        child: Column(
          children: <Widget>[
            //email
            SizedBox(height: 25),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.alternate_email),
                hintText: 'Email',
              ),
            ),

            //password
            SizedBox(height: 25),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            //Forgot your password - reset password page
            SizedBox(height: 5),

            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Container(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ForgotPassword()));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ),

            // Login Button routes to Loginpage
            SizedBox(height: 20),
            Builder(
              builder: (context) => RaisedButton(
                  color: Colors.orange[400],
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    _loginUser(
                        type: LoginType.email,
                        email: _emailController.text,
                        password: _passwordController.text,
                        context: context);
                  }),
            ),
            FlatButton(
              child: Text("Dont have an account? Sign up here"),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignUpPage(),
                  ),
                );
              },
            ),

            _googleButton(),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Li',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'g',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'mone',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Color _lightGreen = Color.fromARGB(255, 226, 238, 218);
    final height = MediaQuery.of(context).size.height;
    var children2 = <Widget>[
      SizedBox(height: height * .2),
      _title(),
      _submitButtonnew(),
      _facebookButton(),
      SizedBox(height: height * .055),
    ];
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          //add shape here
          // Positioned(
          //     top: -height * .15,
          //     right: -MediaQuery.of(context).size.width * .4,
          //     child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: children2,
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
