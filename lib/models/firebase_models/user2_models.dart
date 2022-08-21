import 'package:cloud_firestore/cloud_firestore.dart';

class UserTesting {
  final String id;
  final String avatar;
  final String userName;
  final String email;
  final String phone;

  const UserTesting({
    required this.id,
    required this.avatar,
    required this.userName,
    required this.email,
    required this.phone,
  });

  factory UserTesting.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return UserTesting(
        id: data?['id'],
        avatar: data?['avatar'],
        userName: data?['username'],
        email: data?['email'],
        phone: data?['phone']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'avatar': avatar,
      'username': userName,
      'email': email,
      'phone': phone,
    };
  }
}
