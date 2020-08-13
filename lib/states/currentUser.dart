// ignore: unused_import
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:ligmone/models/user.dart';
import 'package:ligmone/services/userDatabase.dart';

class CurrentUser extends ChangeNotifier {
  OurUser _currentUser = OurUser();

// Access email and password
  OurUser get getCurrentUser => _currentUser;

// Instantiate  firebase
  FirebaseAuth _auth = FirebaseAuth.instance;

  //   function to check whether user is logged in
  Future<String> onStartUp() async {
    String retVal = "error";

    try {
      FirebaseUser _firebaseUser = await _auth.currentUser();
      if (_firebaseUser != null) {
        _currentUser = await OurUserDatabase().getUserInfo(_firebaseUser.uid);
        if (_currentUser != null) {
          retVal = "success";
        }
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  // Signing out the application
  Future<String> signOut() async {
    String retVal = "error";

    try {
      await _auth.signOut();
      _currentUser = OurUser();

      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  //register with email and password
  Future<String> signUpUser(
      String email, String password, String firstName, String lastName) async {
    String retVal = "error";
    OurUser _user = OurUser();
    try {
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user.uid = _authResult.user.uid;
      _user.email = _authResult.user.email;
      _user.firstName = firstName;
      _user.lastName = lastName;
      String _returnString = await OurUserDatabase().createUser(_user);

      if (_returnString == "success") {
        retVal = "success";
      }
    } catch (e) {
      retVal = e.message;
    }
    return retVal;
  }

  //signin with email and password
  Future<String> loginUserWithEmail(String email, String password) async {
    String retVal = "error";
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      _currentUser = await OurUserDatabase().getUserInfo(result.user.uid);
      if (_currentUser != null) {
        retVal = "success";
      }
    } catch (e) {
      retVal = e.message;
    }
    return retVal;
  }
  // Login in facebook

  Future<String> loginUserWithFacebook() async {
    String retVal = "error";
    AuthResult userResult;
    OurUser _user = OurUser();
    try {
      FacebookLogin facebookLogin = new FacebookLogin();
      FacebookLoginResult result = await facebookLogin.logIn(['email']);
      if (result.status == FacebookLoginStatus.loggedIn) {
        final AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token,
        );
        userResult = (await _auth.signInWithCredential(credential));

        // final resultInfo = await facebookLogin.logInWithReadPermissions(['email']);
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');
        //final profile = json.decode(graphResponse.body);
        Map<String, dynamic> profile = json.decode(graphResponse.body);

        if (userResult.additionalUserInfo.isNewUser) {
          _user.uid = profile['uid'];
          _user.email = profile['email'];
          _user.firstName = profile['first_name'];
          _user.lastName = profile['last_name'];
          OurUserDatabase().createUser(_user);
        }
        _currentUser = await OurUserDatabase().getUserInfo(userResult.user.uid);
        if (_currentUser != null) {
          retVal = "success";
        }
      }
    } on PlatformException catch (e) {
      retVal = e.message;
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  //Login With Google
  Future<String> loginUserWithGoogle() async {
    String retVal = "error";
    String splitDislayName = "";
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    OurUser _user = OurUser();
    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      final AuthCredential _credential = GoogleAuthProvider.getCredential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);

      AuthResult result = await _auth.signInWithCredential(_credential);
      if (result.additionalUserInfo.isNewUser) {
        _user.uid = result.user.uid;
        _user.email = result.user.email;
        splitDislayName = result.user.displayName;
        splitDislayName.runes
            .map((rune) => new String.fromCharCode(rune))
            .toList();

        _user.firstName = splitDislayName[0];
        _user.lastName = splitDislayName[1];
        OurUserDatabase().createUser(_user);
      }
      _currentUser = await OurUserDatabase().getUserInfo(result.user.uid);
      if (_currentUser != null) {
        retVal = "success";
      }
    } on PlatformException catch (e) {
      retVal = e.message;
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  // Reset Password
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<String> validate(String value) async {
    if (value.isEmpty) {
      return "Email can't be empty";
    }
    return null;
  }
}
