import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ligmone/screens/editProfile.dart';
import 'package:ligmone/screens/imageUploaderx.dart';

class ProfilePagex extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePagex>
    with SingleTickerProviderStateMixin {
  // Instantiate  firebase
  FirebaseAuth _auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  String firstName = '';
  String lastName = '';
  String email = '';
  String phoneNumber = '';
  String birthday = '';
// Create instance variable
  Future myFuture;
  String _imageUrl;

  @override
  void initState() {
    super.initState();
    // assign this variable your Future
    myFuture = getFuture();
  }

  // Future<String> returnImageUrl(String str) async {
  //   final ref = FirebaseStorage.instance.ref().child('users/str');
  //   String url = await ref.getDownloadURL() as String;
  //   return url;
  // }

  Future<User> getFuture() async {
    return _auth.currentUser;
  }

  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text('Profile'),
        ),
        body: Container(
          color: Colors.white,
          child: FutureBuilder<User>(
            future: myFuture,
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                String userID = snapshot.data.uid;
                var ref =
                    FirebaseStorage.instance.ref().child('users1/$userID.png');
                ref
                    .getDownloadURL()
                    .then((loc) => setState(() => _imageUrl = loc));
                _userDetails(userID);
                return ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 250.0,
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.0, top: 20.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 25.0),
                                        child: new Text('Account Information',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                                fontFamily: 'sans-serif-light',
                                                color: Colors.black)),
                                      )
                                    ],
                                  )),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Stack(fit: StackFit.loose, children: <
                                    Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 140.0,
                                        height: 140.0,
                                        child: _imageUrl == null
                                            ? Image.asset(
                                                'assets/images/profile.png',
                                                height: 110.0,
                                              )
                                            : Image.network(
                                                _imageUrl,
                                                fit: BoxFit.cover,
                                                // image: DecorationImage(
                                                //   image: ExactAssetImage(
                                                //       'assets/images/profile.png'),
                                                //   fit: BoxFit.cover,
                                                // ),
                                              ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(right: 100.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          CircleAvatar(
                                            radius: 25.0,
                                            child: RaisedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ImageCapture(
                                                                userID)));
                                              },
                                              child: Icon(
                                                Icons.camera_alt,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ]),
                              )
                            ],
                          ),
                        ),
                        new Container(
                          color: Color(0xffFFFFFF),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 25.0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'Parsonal Information',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            _status
                                                ? _getEditIcon()
                                                : new Container(),
                                          ],
                                        )
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'First Name',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new Text(
                                            //decoration: const InputDecoration(
                                            //  hintText: "Enter Your Name",
                                            '$firstName',
                                          ),
                                          // enabled: !_status,
                                          //  autofocus: !_status,
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'Last Name',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new Text(
                                            // decoration: const InputDecoration(
                                            //   hintText: "Enter Email ID"),
                                            //   enabled: !_status,
                                            '$lastName',
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'Email',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new Text(
                                            //decoration: const InputDecoration(
                                            //    hintText:
                                            //    "Enter Mobile Number"),
                                            // enabled: !_status,
                                            '$email',
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'Mobile',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: new Text(
                                              'Birthday',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          // child: Padding(
                                          //   padding:
                                          //       EdgeInsets.only(right: 10.0),
                                          child: Text(
                                            '$phoneNumber',
                                          ),
                                          flex: 4,
                                        ),
                                        Flexible(
                                          child: Text(
                                            '$birthday',
                                          ),
                                          flex: 4,
                                        ),
                                      ],
                                    )),
                                !_status
                                    ? _getActionButtons()
                                    : new Container(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Future<DocumentSnapshot> getData(userID) async {
// return await     Firestore.instance.collection('users').document(userID).get();
    DocumentSnapshot result =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();

    firstName = result.data()['nickname'] ?? firstName;
    lastName = result.data()['nickname'] ?? lastName;
    email = result.data()['email'] ?? email;
    phoneNumber = result.data()['phoneNumber'] ?? phoneNumber;
    birthday = result.data()['birthday'] ?? birthday;
    return result;
  }

  Future<void> _userDetails(userID) async {
    final userDetails = await getData(userID);
    if (this.mounted) {
      setState(() {
        userDetails.toString(); // Your state change code goes here
      });
    }
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

// Edit User profile Page
  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        // setState(() {
        //   _status = false;
        // });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EditProfile()));
      },
    );
  }
}
