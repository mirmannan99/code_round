import 'package:code_round/features/home/view/home_screen.dart';
import 'package:code_round/features/signup/view_model/signup_view_model.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helper/validation.dart';
import '../../../widgets/button.dart';
import '../../../widgets/tex_field.dart';
import '../models/signup_model.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpViewModel provider = Provider.of<SignUpViewModel>(context);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: provider.isLoading
          ? Center(child: const CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Form(
                    key: provider.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 46,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please enter your details below to\n sign up now !",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: RadioListTile(
                                title: Text("Families"),
                                value: "0",
                                activeColor: Colors.indigo,
                                groupValue: provider.type,
                                onChanged: (value) {
                                  provider.typeOf = value.toString();
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile(
                                title: Text("Providers"),
                                value: "1",
                                activeColor: Colors.indigo,
                                groupValue: provider.type,
                                onChanged: (value) {
                                  provider.typeOf = value.toString();
                                },
                              ),
                            ),
                          ],
                        ),
                        textField(
                          fieldLength: 15,
                          fieldName: "First Name",
                          inputFormatter: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-z A-Z]')),
                          ],
                          validationEmpty: "first name",
                          keyboardLayout: TextInputType.name,
                          textController: provider.firstNameTC,
                          validation: validationFirstName,
                        ),
                        textField(
                          fieldLength: 15,
                          fieldName: "Last Name",
                          inputFormatter: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-z A-Z]')),
                          ],
                          validationEmpty: "last name",
                          keyboardLayout: TextInputType.name,
                          textController: provider.lastNameTC,
                          validation: validationLastName,
                        ),
                        textField(
                          fieldLength: 100,
                          fieldName: "Email Address",
                          validationEmpty: "a valid email address",
                          keyboardLayout: TextInputType.emailAddress,
                          textController: provider.emailTc,
                          validation: validationEmail,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: CountryCodePicker(
                                  boxDecoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.6),
                                  ),
                                  enabled: true,
                                  showFlag: true,
                                  backgroundColor: Colors.grey.withOpacity(0.3),
                                  initialSelection: "IN",
                                  favorite: ["+91", "IN"],
                                  showCountryOnly: false,
                                  showOnlyCountryWhenClosed: false,
                                  alignLeft: false,
                                  onInit: (CountryCode? obj) {
                                    provider.countryCode = obj!.dialCode;
                                    provider.flagUrl = obj.flagUri;
                                  },
                                  onChanged: (CountryCode? obj) {
                                    provider.countryCode = obj!.dialCode;
                                    provider.flagUrl = obj.flagUri;
                                  },
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: textField(
                                  fieldLength: 10,
                                  textController: provider.phoneTc,
                                  keyboardLayout: TextInputType.number,
                                  validation: validateMobile,
                                  fieldName: "Phone Number",
                                  validationEmpty: 'phone number',
                                ),
                              ),
                            ],
                          ),
                        ),
                        textField(
                            fieldLength: 20,
                            validation: validatePassword,
                            fieldName: "Password",
                            validationEmpty: "password",
                            keyboardLayout: TextInputType.visiblePassword,
                            textController: provider.passwordTc,
                            hide: provider.showPass,
                            showPass: () {
                              setState(() {
                                provider.showPass = false;
                              });
                            }),
                        textField(
                          validation: validatePassword,
                          fieldName: "Confirm Password",
                          validationEmpty: "",
                          keyboardLayout: TextInputType.visiblePassword,
                          textController: provider.confirmPasswordTc,
                          hide: true,
                          fieldLength: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("* indicates the mandatory fields"),
                            SizedBox(
                              height: 5,
                            ),
                            button(
                              btnText: "Sign Up",
                              btnPress: () async {
                                if (provider.formKey.currentState!.validate()) {
                                  //! creating object for the post request
                                  final insert = SignUp(
                                    firstname: provider.firstNameTC.text,
                                    lastname: provider.lastNameTC.text,
                                    email: provider.emailTc.text,
                                    mobile: provider.phoneTc.text,
                                    type: provider.type,
                                    country: "in",
                                  );
                                  provider.loading();
                                  final result = await provider.apiServices
                                      .register(insert);

                                  if (result.responseCode == 200) {
                                    //! adding data to shared preference as an list of strings
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs
                                        .setStringList('signup', <String>[
                                      provider.firstNameTC.text,
                                      provider.lastNameTC.text,
                                      provider.emailTc.text,
                                      provider.phoneTc.text,
                                      provider.type!,
                                      "in"
                                    ]);
                                    Fluttertoast.showToast(
                                        msg: result.data!.message.toString(),
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.indigo,
                                        textColor: Colors.white,
                                        fontSize: 14.0);
                                    provider.loading();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Home()),
                                        ModalRoute.withName('/'));
                                  }
                                }
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Have an Account? ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
