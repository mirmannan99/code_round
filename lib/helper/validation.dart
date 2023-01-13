String? validationFirstName(value) {
  if (value!.isEmpty) {
    return "Please enter first name.";
  } else if (value.length < 2) {
    return "first name Should be greater than 4 characters";
  }
  return null;
}

String? validationLastName(value) {
  if (value!.isEmpty) {
    return "Please enter last Name.";
  } else if (value.length < 2) {
    return "last name Should be greater than 4 characters";
  }
  return null;
}

String? validationEmail(value) {
  RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (value!.isEmpty) {
    return "Please enter Email";
  } else if (!regex.hasMatch(value)) {
    return "please enter a valid email";
  }
  return null;
}

String? validatePassword(String? value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value!.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Password contains at least 8 characters,\n 1 lower case (a-z) \n& 1 Upper case (A-Z), 1 number (0-9) or a symbol';
    } else {
      return null;
    }
  }
}

String? validateMobile(String? value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(patttern);
  if (value!.length == 0) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}
