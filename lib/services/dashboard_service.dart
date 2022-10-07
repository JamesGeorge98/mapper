// import 'dart:async';
// import 'package:coin/models/dashboard_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class APIDashboardService {
//   Future<DashboardResponseModel> dashboardData() async {
//     SharedPreferences perfs = await SharedPreferences.getInstance();
//     String? uuid = perfs.getString("uuid");

//     var url = Uri.parse(
//         "https://gbcgroup.co.in/api_gfyhfhfghtrtyrtkhkdfg_gfhg/dashboard.php?uuid=$uuid");
//     final response = await http.get(url);

//     if (response.statusCode == 200 || response.statusCode == 400) {
//       var status = DashboardResponseModel.fromJson(json.decode(response.body));
//       return status;
//     } else {
//       throw Exception('failed to load Data');
//     }
//   }
// }

// class APIDashboardLiveRateService {
//   Future dashboardLiveRateData() async {
//     SharedPreferences perfs = await SharedPreferences.getInstance();
//     String? uuid = perfs.getString("uuid");
//     var url = Uri.parse(
//         "https://gbcgroup.co.in/api_gfyhfhfghtrtyrtkhkdfg_gfhg/gedtratesc.php?uuid=$uuid");
//     final response = await http.get(url);
//     if (response.statusCode == 200 || response.statusCode == 400) {
//       Map<String, dynamic> coinLiveRate = jsonDecode(response.body);
//       return coinLiveRate['coin_live_rate'];
//     } else {
//       throw Exception('failed to load Data');
//     }
//   }
// }
