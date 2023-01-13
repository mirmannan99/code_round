import 'dart:convert';

SignUpResponse? signUpResponseFromJson(String str) =>
    SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse? data) =>
    json.encode(data!.toJson());

class SignUpResponse {
  SignUpResponse({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  int? code;
  String? status;
  String? message;
  Data? data;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
