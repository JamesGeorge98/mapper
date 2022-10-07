
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mapper/models/signup_model.dart';

class APISignUpService {
  Future<SignUpResponseModel> login(SignUpRequestModel requestModel) async {
    var url = Uri.parse("http://192.168.0.103:3000/api/signup");
    final response = await http.post(url,
        body: jsonEncode(requestModel),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',});
    if (response.statusCode == 200 || response.statusCode == 400) {
      var loginStatus = SignUpResponseModel.fromJson(json.decode(response.body));
      return loginStatus;
    } else {
      throw Exception('failed to load Data');
    }
  }
}
