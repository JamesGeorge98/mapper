import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/profile_model.dart';

class ProfileApiService {
  Future<profileResponseModel> profile() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    String? email = perfs.getString("email");
    var url = Uri.parse("http://192.168.0.103:3000/api/profile");
    final response = await http.post(url,
        body: jsonEncode({"email": email}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var loginStatus =
          profileResponseModel.fromJson(json.decode(response.body));
      return loginStatus;
    } else {
      throw Exception('failed to load Data');
    }
  }
}

class ProfileUpdateApiService {
  Future<profileResponseModel> profileupdate(
      email, password, name, address) async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    String? email = perfs.getString("email");
    var url = Uri.parse("http://192.168.0.103:3000/api/profileupdate");
    final response = await http.post(url,
        body: jsonEncode({
          "email": email,
          "password": password,
          "name": name,
          "address": address
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var loginStatus =
          profileResponseModel.fromJson(json.decode(response.body));
      return loginStatus;
    } else {
      throw Exception('failed to load Data');
    }
  }
}
