import 'package:cloud_firestore/cloud_firestore.dart';

// our user Data Model
class OurUser {
  String uid;
  String firstName;
  String lastName;
  String email;
  Timestamp accountCreated;
  OurUser(
      {this.uid,
      this.firstName,
      this.lastName,
      this.email,
      this.accountCreated});
}

class ChatClass {
  String uid;
  String nickname;
  String photoUrl;
  String aboutMe;

  ChatClass({this.uid, this.nickname, this.photoUrl, this.aboutMe});
}
