import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ligmone/models/user.dart';

class OurUserDatabase {
  final Firestore _firestore = Firestore.instance;

  Future<String> createUser(OurUser user) async {
    String retVal = "error";

    try {
      await _firestore.collection("users").document(user.uid).setData({
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
    QuerySnapshot qn = await _firestore.collection("users").getDocuments();
    return qn.documents;
  }

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retVal = OurUser();

    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection("users").document(uid).get();
      if (_docSnapshot.exists) {
        retVal.uid = uid;
        retVal.firstName = _docSnapshot.data["firstName"];
        retVal.lastName = _docSnapshot.data["lastName"];
        retVal.email = _docSnapshot.data["email"];
        retVal.accountCreated = _docSnapshot.data["accountCreated"];
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
