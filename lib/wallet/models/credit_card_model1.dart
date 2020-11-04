class CreditCardModel1 {
  String id, _cardNo, _expiryDate, _cvv, _logo;
  int _balance,
      _expense,
      _foodCost,
      _billCost,
      _homeImprovementCost,
      _transportationCost,
      _atmWithdrawl,
      _healthCost,
      _saving;
  CreditCardModel1(
      this._cardNo,
      this._logo,
      this._expiryDate,
      this._cvv,
      this._balance,
      this._expense,
      this._foodCost,
      this._billCost,
      this._homeImprovementCost,
      this._transportationCost,
      this._atmWithdrawl,
      this._healthCost,
      this._saving)
      : assert(_cardNo.length == 16);

  CreditCardModel1.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    _cardNo = data['_cardNo'];
    _expiryDate = data['_expiryDate'];
    _cvv = data['_cvv'];
    _logo = data['_logo'];
    _balance = data['_balance'];
    _expense = data['_expense'];
    _foodCost = data['_foodCost'];
    _billCost = data['_billCost'];
    _homeImprovementCost = data['_homeImprovementCost'];
    _transportationCost = data['_transportationCost'];
    _atmWithdrawl = data['_atmWithdrawl'];
    _healthCost = data['_healthCost'];
    _saving = data['_saving'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      '_cardNo': _cardNo,
      '_expiryDate': _expiryDate,
      '_cvv': _cvv,
      '_logo': _logo,
      '_balance': _balance,
      '_expense': _expense,
      '_foodCost': _foodCost,
      '_billCost': _billCost,
      '_homeImprovementCost': _homeImprovementCost,
      '_transportationCost': _transportationCost,
      '_atmWithdrawl': _atmWithdrawl,
      '_healthCost': _healthCost,
      '_saving': _saving,
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
  int get balance => _balance;
  int get expense => _expense;
  int get food => _foodCost;
  int get bill => _billCost;
  int get home => _homeImprovementCost;
  int get transport => _transportationCost;
  int get atm => _atmWithdrawl;
  int get health => _healthCost;
  int get saving => _saving;
}
