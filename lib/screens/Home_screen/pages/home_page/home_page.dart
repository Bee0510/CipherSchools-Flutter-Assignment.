// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:cipher_schools/database/fetchTransaction.dart';
import 'package:cipher_schools/screens/Home_screen/pages/home_page/widgets/transaction_section.dart';
import 'package:cipher_schools/utils/size_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../models/database_model.dart';
import 'widgets/filter_menu.dart';
import 'widgets/recent_transaction_section.dart';
import 'widgets/statistic_section.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final getTransaction confirm = getTransaction();
  List<transaction> transactions = [];
  final data = FirebaseAuth.instance.currentUser;
  Future<void> loadTransactions() async {
    try {
      List<transaction> loadedTransactions =
          await confirm.getPendingConfirmation(data!.uid);
      loadedTransactions.sort((a, b) => b.date.compareTo(a.date));
      setState(() {
        transactions = loadedTransactions;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    loadTransactions();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(width: getHorizontalSize(44)),
          statistic_section(),
          // SizedBox(height: getVerticalSize(9)),
          FilterMenu(),
          recent_transaction_section(),
          transaction_section(data: transactions),
        ],
      ),
    );
  }
}
