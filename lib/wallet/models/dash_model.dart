import 'package:flutter/material.dart';

class DashModel {
  String _name;

  IconData _icon;
  Color _color;

  DashModel(this._name, this._icon, this._color);

  String get name => _name;

  IconData get icon => _icon;
  Color get color => _color;
}
