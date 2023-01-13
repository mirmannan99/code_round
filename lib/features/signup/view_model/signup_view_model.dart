import 'package:flutter/widgets.dart';

import '../services/api_servives_signup.dart';

class SignUpViewModel extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //!text Editing controllers
  TextEditingController firstNameTC = TextEditingController();
  TextEditingController lastNameTC = TextEditingController();
  TextEditingController emailTc = TextEditingController();
  TextEditingController phoneTc = TextEditingController();
  TextEditingController passwordTc = TextEditingController();
  TextEditingController confirmPasswordTc = TextEditingController();

  ApiServices apiServices = ApiServices();
  bool showPass = true;
  String? type = "0";
  String? countryCode = "";
  String? flagUrl = "";
  bool isLoading = false;

  set typeOf(value) {
    type = value;
    notifyListeners();
  }

  void loading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
