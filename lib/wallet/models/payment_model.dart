class PaymentModel {
  String _name;

  var _amount;
  var _paymentType;
  String _createDateTime;
  PaymentModel(
      this._name, this._amount, this._paymentType, this._createDateTime);

  PaymentModel.fromMap(Map<String, dynamic> data) {
    _name = data['_name'];
    _createDateTime = data['_createDateTime'];

    _amount = data['_amount'];
    _paymentType = data['_paymentType'];
  }

  Map<String, dynamic> toMap() {
    return {
      '_name': _name,
      '_createDateTime': _createDateTime,
      '_amount': _amount,
      '_paymentType': _paymentType,
    };
  }

  String get name => _name;

  String get date => _createDateTime;

  int get amount => _amount;

  int get type => _paymentType;
}
