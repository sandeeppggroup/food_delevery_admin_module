class AdminLoginModel {
  final String token;

  AdminLoginModel({required this.token});

  factory AdminLoginModel.fromJson(Map<String, dynamic> json) {
    return AdminLoginModel(token: json['data']);
  }
}
