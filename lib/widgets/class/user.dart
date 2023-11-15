import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<UserProvider> userFromJson(String str) => List<UserProvider>.from(
    json.decode(str).map((x) => UserProvider.fromJson(x)));

String userToJson(List<UserProvider> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserProvider {
  String id;
  String email;
  String nombres;

  UserProvider({
    required this.id,
    required this.email,
    required this.nombres,
  });

  factory UserProvider.fromJson(Map<String, dynamic> json) => UserProvider(
        id: json["id"],
        email: json["email"],
        nombres: json["nombres"] ?? "Usuario",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "nombres": nombres,
      };
}
