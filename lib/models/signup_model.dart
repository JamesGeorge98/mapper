class SignUpResponseModel {
  String? msg;
 

  SignUpResponseModel(
      {this.msg,
      });

  SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    
  }
}

class SignUpRequestModel {
  String? name;
  String? email;
  String? password;
  String? address;
  

  SignUpRequestModel({
    this.email,
    this.password,
    this.name,
    this.address,

  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name?.trim(),
      'password': password?.trim(),
      'email': email?.trim(),
      'address': address?.trim(),
    
    };
    return map;
  }
}
