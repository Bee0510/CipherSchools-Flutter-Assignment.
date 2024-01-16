// ignore_for_file: unused_field, unused_element

import 'dart:math';
import 'package:cipher_schools/models/auth_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class user_base {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Requesting Money
  Future<void> saveInfo(
    Users user,
    String name,
    String email,
    String password,
  ) async {
    await _firestore.collection('Users').doc(user.uid).set({
      'user_id': user.uid,
      'name': name,
      'Email': email,
      'password': password,
      'date': DateTime.now(),
    });
  }
}
