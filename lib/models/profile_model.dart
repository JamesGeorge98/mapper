class profileResponseModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;

  profileResponseModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
  });

  factory profileResponseModel.fromJson(Map<String, dynamic> json) {
    return profileResponseModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      address: json['address'],
    );
  }
}