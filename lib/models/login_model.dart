class LoginResponseModel {
  String? msg;
  bool? status;

  LoginResponseModel({
    this.msg,
    this.status
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
  }
}

class LoginRequestModel {
  String? email;
  String? password;

  LoginRequestModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email!.trim(),
      'password': password!.trim(),
    };
    return map;
  }
}
