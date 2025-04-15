import 'package:cloud_firestore/cloud_firestore.dart';

class AccountModel {
  final String id;
  final String name;
  final String link;
  final String email;
  final String password;
  final DateTime createdAt;

  AccountModel({
    required this.id,
    required this.name,
    required this.link,
    required this.email,
    required this.password,
    required this.createdAt,
  });

  // ✅ لتحويل Map من Firestore إلى كائن AccountModel
  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'] ?? '', // نأخذ id المضمن داخل الوثيقة
      name: json['name'] ?? '',
      link: json['link'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  // ✅ لتحويل الكائن إلى Map قبل إرساله إلى Firestore
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'link': link,
      'email': email,
      'password': password,
      'createdAt': createdAt,
    };
  }
}
