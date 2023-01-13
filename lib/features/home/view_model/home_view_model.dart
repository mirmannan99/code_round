import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  String? type = "0";
  bool checkBox1 = false;

  List<String> timeSlot = [
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
    '9:00-9:30 Am',
  ];

  void checkbox() {
    checkBox1 = !checkBox1;
    notifyListeners();
  }

  set typeOf(value) {
    type = value;
    notifyListeners();
  }
}
