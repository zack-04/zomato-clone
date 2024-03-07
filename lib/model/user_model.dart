import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  UserProfile({
    required this.name,
    required this.email,
    required this.dob,
    required this.gender,
    required this.phoneNumber,
  });
  String name;
  String email;
  String dob;
  String gender;
  String phoneNumber;
  factory UserProfile.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return UserProfile(
      name: data?["name"],
      email: data?["email"],
      dob: data?["dob"],
      gender: data?["gender"],
      phoneNumber: data?["phoneNumber"],
    );
  }
}
