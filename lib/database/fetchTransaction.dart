import 'package:cipher_schools/models/database_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class getTransaction {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<transaction>> getPendingConfirmation(String uid) async {
    final pendingConfirm1 = await _firestore
        .collection('Expenses')
        .where('user_id', isEqualTo: uid)
        .where('type', isEqualTo: 'Expense')
        .get();

    final pendingConfirm2 = await _firestore
        .collection('Incomes')
        .where('user_id', isEqualTo: uid)
        .where('type', isEqualTo: 'Income')
        .get();

    final pendingConfirm = pendingConfirm1.docs + pendingConfirm2.docs;
    List<transaction> transactionData = [];

    try {
      if (pendingConfirm.isNotEmpty) {
        for (var doc in pendingConfirm) {
          transactionData.add(transaction(
            Transaction_id: doc['Transaction_id'],
            type: doc['type'],
            catagory: doc['catagory'],
            amount: doc['amount'],
            date: doc['date'].toDate(),
            user_id: doc['user_id'],
            description: doc['description'],
            wallet: doc['wallet'],
          ));
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return transactionData;
  }
}
