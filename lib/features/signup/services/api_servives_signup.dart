import 'dart:convert';

import 'package:code_round/features/signup/controller/api_response.dart';
import 'package:http/http.dart' as http;

import '../models/signup_model.dart';
import '../models/signup_model_response.dart';

class ApiServices {
  String url = "https://vibrobike.solutiontrackers.biz/api/signUpDemo";

  Future<ApiResponse<SignUpResponse>> register(SignUp signup) async {
    var newUrl = Uri.parse(url);
    try {
      final headers = {"Content-Type": "application/json"};

      final jsonData = jsonEncode(signup);

      var response = await http.post(newUrl, headers: headers, body: jsonData);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        return ApiResponse<SignUpResponse>(
            data: SignUpResponse.fromJson(jsonData),
            responseCode: response.statusCode);
      }
      return ApiResponse<SignUpResponse>(
          error: true, errorMessage: "An error Occurred");
    } catch (e) {
      rethrow;
    }
  }
}
