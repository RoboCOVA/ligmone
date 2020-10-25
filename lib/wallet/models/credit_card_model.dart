import 'package:cloud_firestore/cloud_firestore.dart';

class CreditCardModel {
  String id, _cardNo, _expiryDate, _cvv, _logo;
  CreditCardModel(this._cardNo, this._logo, this._expiryDate, this._cvv)
      : assert(_cardNo.length == 16);

  CreditCardModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    _cardNo = data['_cardNo'];
    _expiryDate = data['_expiryDate'];
    _cvv = data['_cvv'];
    _logo = data['_logo'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      '_cardNo': _cardNo,
      '_expiryDate': _expiryDate,
      '_cvv': _cvv,
      '_logo': _logo,
    };
  }

  String get cardNo {
    var letters = [];
    for (int i = 0; i < _cardNo.length;) {
      letters.add(_cardNo.substring(i, ((i ~/ 4) + 1) * 4));
      i += 4;
    }
    var fakeCardNo = "";
    for (int i = 0; i < letters.length; i++) {
      if (i == letters.length - 1) {
        fakeCardNo += letters[i];
        break;
      }
      fakeCardNo += "****    ";
    }
    return fakeCardNo;
  }

  String get logo => _logo;

  String get cvv => _cvv;

  String get expiryDate => _expiryDate;
}
