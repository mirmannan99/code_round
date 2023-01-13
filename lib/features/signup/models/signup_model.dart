import 'dart:convert';

SignUp? signUpFromJson(String str) => SignUp.fromJson(json.decode(str));

String signUpToJson(SignUp? data) => json.encode(data!.toJson());

class SignUp {
  SignUp({
    this.userId,
    this.firstname,
    this.lastname,
    this.mobile,
    this.country,
    this.email,
    this.type,
  });

  int? userId;
  String? firstname;
  String? lastname;
  String? mobile;
  String? country;
  String? email;
  String? type;

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
        userId: json["userId"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        mobile: json["mobile"],
        country: json["country"],
        email: json["email"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstname": firstname,
        "lastname": lastname,
        "mobile": mobile,
        "country": country,
        "email": email,
        "type": type,
      };
}
