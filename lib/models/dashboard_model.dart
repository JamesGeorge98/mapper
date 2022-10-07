
// ignore_for_file: non_constant_identifier_names

class DashboardResponseModel {
  final String? gbccoin_wallet;
  final String? direct_commision_coin;
  final String? ref_commision_coin;
  final dynamic total_coin;
  final String? email_Id;
  final String? username;
  final String? sponcername;
  final String? joining_Date;
  final String? mobile_no;
  final String? real_email;
  final String? activation_state_code;
  final String? kyc_status;

  DashboardResponseModel({
    required this.gbccoin_wallet,
    required this.direct_commision_coin,
    required this.ref_commision_coin,
    required this.total_coin,
    required this.email_Id,
    required this.username,
    required this.sponcername,
    required this.joining_Date,
    required this.mobile_no,
    required this.real_email,
    required this.activation_state_code,
    required this.kyc_status,
  });

  factory DashboardResponseModel.fromJson(Map<dynamic, dynamic> json) {
    return DashboardResponseModel(
        gbccoin_wallet: json['gbccoin_wallet'],
        direct_commision_coin: json['direct_commision_coin'],
        ref_commision_coin: json['ref_commision_coin'],
        total_coin: json['total_coin'],
        email_Id: json['email_id'],
        username: json['username'],
        sponcername: json['sponcername'],
        joining_Date: json['joining_date'],
        mobile_no: json['mobile_no'],
        real_email: json['real_email'],
        activation_state_code: json['activation_state_code'],
        kyc_status: json['kyc_status']);
  }
}
