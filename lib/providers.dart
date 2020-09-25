import 'package:flutter/material.dart';

class Providers extends ChangeNotifier {
  Color _color, _secColor;
  String _msg = "Initial Message";

  void changeColor(Color color) {
    print("Color Change");
    _color = color;
    notifyListeners();
  }

  void changeSecColor(Color color) {
    print("Sec Color Change");
    _secColor = color;
    notifyListeners();
  }

  void changeMessage(String msg) {
    _msg = msg;
    notifyListeners();
  }

  Color get color => _color;
  Color get secColor => _secColor;
  String get msg => _msg;
}
