import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget button({required String btnText, required Function() btnPress}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.circular(10),
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: btnPress,
      child: Text(
        btnText,
        style: TextStyle(fontSize: 20),
      ),
    ),
  );
}
