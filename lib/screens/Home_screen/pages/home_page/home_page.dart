// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:cipher_schools/screens/Home_screen/pages/home_page/widgets/transaction_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/filter_menu.dart';
import 'widgets/recent_transaction_section.dart';
import 'widgets/statistic_section.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(width: 44),
          statistic_section(),
          SizedBox(height: 9),
          FilterMenu(),
          recent_transaction_section(),
          transaction_section(),
        ],
      ),
    );
  }
}
