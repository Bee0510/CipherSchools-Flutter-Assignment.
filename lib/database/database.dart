// ignore_for_file: unused_field, unused_element

import 'dart:math';

import 'package:cipher_schools/models/auth_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class transaction_base {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String generateRandomUid() {
    Random random = Random();
    List<int> uidDigits = List.generate(16, (index) => random.nextInt(10));
    String uid = uidDigits.join();
    return uid;
  }

  //Requesting Money
  Future<void> expenseRequest(
    Users user,
    String amount,
    String description,
    String catagory,
    String wallet,
  ) async {
    String randomid = generateRandomUid();
    await _firestore.collection('Expenses').doc(randomid).set({
      'Transaction_id': randomid,
      'user_id': user.uid,
      'type': 'Expense',
      'catagory': catagory,
      'amount': amount,
      'date': DateTime.now(),
      'description': description,
      'wallet': wallet,
    });
  }

  Future<void> incomeRequest(
    Users user,
    String amount,
    String description,
    String catagory,
    String wallet,
  ) async {
    String randomid = generateRandomUid();
    await _firestore.collection('Incomes').doc(randomid).set({
      'Transaction_id': randomid,
      'user_id': user.uid,
      'type': 'Income',
      'catagory': catagory,
      'amount': amount,
      'date': DateTime.now(),
      'description': description,
      'wallet': wallet,
    });
  }

  Future<void> deleteIncome(String transactionId) async {
    try {
      WriteBatch batch = _firestore.batch();
      DocumentReference documentReference1 =
          _firestore.collection('Incomes').doc(transactionId);
      DocumentReference documentReference2 =
          _firestore.collection('Expenses').doc(transactionId);
      batch.delete(documentReference1);
      batch.delete(documentReference2);
      await batch.commit();

      print('Income deleted successfully');
    } catch (e) {
      print('Error deleting income: $e');
    }
  }
}
