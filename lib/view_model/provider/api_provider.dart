import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? _token;

  String? get token => _token;

  void setToken(String value) {
    _token = value;
    notifyListeners();
  }

  void logout() {
    _token = null;
    notifyListeners();
  }
}
