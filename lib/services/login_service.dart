import 'package:mapper/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APILoginService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    var url = Uri.parse("http://192.168.0.103:3000/api/signin");
    final response = await http.post(url,
        body: jsonEncode(requestModel),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var loginStatus = LoginResponseModel.fromJson(json.decode(response.body));
      return loginStatus;
    } else {
      throw Exception('failed to load Data');
    }
  }
}
