class User {
  final int id;
  final String email;
  final String name;
  final int roleId;
  final String status;
  final String createdAt;
  String? token;

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.roleId,
      required this.status,
      required this.createdAt,
      required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        email: json['email'] ?? "",
        name: json['name'],
        roleId: json['role_id'] ?? 1,
        status: json['status'] ?? "",
        createdAt: json['created_at'] ?? "",
        token: json['token'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'role_id': roleId,
      'status': status,
      'created_at': createdAt,
      'token': token
    };
  }
}
