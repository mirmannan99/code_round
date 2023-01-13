import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget textField(
    {required String fieldName,
    required String validationEmpty,
    List<TextInputFormatter>? inputFormatter,
    bool hide = false,
    required TextEditingController textController,
    required TextInputType keyboardLayout,
    required String? Function(String?)? validation,
    required int fieldLength,
    void Function()? showPass}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      maxLength: fieldLength,
      controller: textController,
      keyboardType: keyboardLayout,
      obscureText: hide,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatter,
      validator: validation,
      decoration: textDecoration(
          fieldName: fieldName, obscure: hide, showPass: showPass),
    ),
  );
}

InputDecoration textDecoration(
    {required String fieldName,
    required bool obscure,
    void Function()? showPass}) {
  return InputDecoration(
    counterText: "",
    errorMaxLines: 1,
    hintText: "$fieldName*",
    hintStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    filled: true,
    suffixIcon: obscure
        ? IconButton(
            icon: Icon(
              Icons.remove_red_eye,
            ),
            onPressed: showPass,
          )
        : Icon(
            Icons.remove_red_eye,
            color: Colors.transparent,
          ),
    fillColor: Colors.grey.withOpacity(0.3),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.transparent,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.transparent,
        )),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.redAccent,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.redAccent,
      ),
    ),
    errorStyle: TextStyle(
      fontSize: 14,
    ),
  );
}
