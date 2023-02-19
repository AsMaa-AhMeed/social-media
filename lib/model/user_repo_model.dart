import 'dart:convert';

List<UserRepoModel> userRepoModelFromJson(String str) =>
    List<UserRepoModel>.from(
        json.decode(str).map((x) => UserRepoModel.fromJson(x)));

class UserRepoModel {
  UserRepoModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
    required this.creationAt,
    required this.updatedAt,
  });

  int id;
  String email;
  String password;
  String name;
  String role;
  String avatar;
  String creationAt;
  String updatedAt;

  factory UserRepoModel.fromJson(Map<String, dynamic> json) => UserRepoModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        role: json["role"],
        avatar: json["avatar"],
        creationAt: json["creationAt"],
        updatedAt: json["updatedAt"],
      );
}
