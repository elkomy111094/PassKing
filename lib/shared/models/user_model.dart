import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final String deviceToken;
  final String createdAt; // Firebase timestamp for when the user was created

  UserModel({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.deviceToken,
    required this.createdAt,
  });

  // Factory constructor to create a UserModel from Firestore document data
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      deviceToken: json['device_token'] ?? '',
      createdAt: json['createdAt'].toString() ?? Timestamp.now().toString(),
    );
  }

  // Method to convert UserModel to JSON to save to Firestore
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'device_token': deviceToken,
      'createdAt': createdAt,
    };
  }
}
