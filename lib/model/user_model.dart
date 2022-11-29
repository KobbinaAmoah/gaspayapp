import 'package:cloud_firestore/cloud_firestore.dart';

final _db = FirebaseFirestore.instance;

class UserModel {
  final String name;
  final String email;
  final String phone;
  final String uid;
  final DateTime createdAt;
  UserModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.createdAt,
      required this.uid});

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        phone = json['phone'],
        createdAt = DateTime.parse(json['createdAt']),
        uid = json['uid'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'createdAt': createdAt.toIso8601String(),
        'phone': phone,
        'uid': uid,
      };
  static Future<UserModel> getUserData(String uid) async {
    try {
      var doc = await _db.collection('users').doc(uid).get();
      var user = UserModel.fromJson(doc.data()!);
      return user;
    } on FirebaseException catch (e) {
      throw (e.message ?? "Something went wrong");
    }
  }

  Future<void> saveNewUser() async {
    try {
      await _db
          .collection('users')
          .doc(uid)
          .set(toJson(), SetOptions(merge: true));
    } on FirebaseException catch (e) {
      throw (e.message ?? "Something went wrong");
    }
  }

  Future<void> updateUser() async {
    try {
      await _db.collection('users').doc(uid).update(toJson());
    } on FirebaseException catch (e) {
      throw (e.message ?? "Something went wrong");
    }
  }

  Future<void> deleteUser() async {
    try {
      await _db.collection('users').doc(uid).delete();
    } on FirebaseException catch (e) {
      throw (e.message ?? "Something went wrong");
    }
  }
}
