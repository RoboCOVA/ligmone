import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ligmone/models/user.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(OurUser user) async {
    String retVal = "error";

    try {
      await _firestore.collection("users").doc(user.uid).set({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'accountCreate': Timestamp.now(),
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

// not used yet - importat for receving data
  Future getUserData() async {
    QuerySnapshot qn = await _firestore.collection("users").get();
    return qn.docs;
  }

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retVal = OurUser();

    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection("users").doc(uid).get();
      if (_docSnapshot.exists) {
        retVal.uid = uid;
        retVal.firstName = _docSnapshot.data()["firstName"];
        retVal.lastName = _docSnapshot.data()["lastName"];
        retVal.email = _docSnapshot.data()["email"];
        retVal.accountCreated = _docSnapshot.data()["accountCreated"];
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
