class PaymentModel {
  String _name, _date, _hour;

  double _amount;
  int _paymentType;

  PaymentModel(
      this._name, this._date, this._hour, this._amount, this._paymentType);

  PaymentModel.fromMap(Map<String, dynamic> data) {
    _name = data['_name'];
    _date = data['_date'];
    _hour = data['_hour'];
    _amount = data['_amount'];
    _paymentType = data['_paymentType'];
  }

  Map<String, dynamic> toMap() {
    return {
      '_name': _name,
      '_date': _date,
      '_hour': _hour,
      '_amount': _amount,
      '_paymentType': _paymentType,
    };
  }

  String get name => _name;

  String get date => _date;

  String get hour => _hour;

  double get amount => _amount;

  int get type => _paymentType;
}
