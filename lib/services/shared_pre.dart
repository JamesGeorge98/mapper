import 'package:shared_preferences/shared_preferences.dart';

Future<bool> saveEmailPreference(String email) async {
  SharedPreferences perfs = await SharedPreferences.getInstance();
  perfs.setString("email", email);
  return perfs.commit();
}

Future<String?> getEmailPreference() async {
  SharedPreferences perfs = await SharedPreferences.getInstance();
  String? email = perfs.getString("email");
  return email;
}
  