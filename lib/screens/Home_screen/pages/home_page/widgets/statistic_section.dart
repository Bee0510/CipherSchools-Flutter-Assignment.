// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cipher_schools/database/fetchTransaction.dart';
import 'package:cipher_schools/utils/image_constant.dart';
import 'package:cipher_schools/utils/size_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../models/database_model.dart';

class statistic_section extends StatefulWidget {
  const statistic_section({
    super.key,
  });

  @override
  State<statistic_section> createState() => _statistic_sectionState();
}

class _statistic_sectionState extends State<statistic_section> {
  final getTransaction confirm = getTransaction();
  List<transaction> transactions = [];
  int totalIncome = 0;
  int totalExpense = 0;
  final data = FirebaseAuth.instance.currentUser;

  Future<void> loadTransactions() async {
    try {
      List<transaction> loadedTransactions =
          await confirm.getPendingConfirmation(data!.uid);
      loadedTransactions.sort((a, b) => b.date.compareTo(a.date));
      int totalInmoney = loadedTransactions
          .where((transaction) => transaction.type == 'Income')
          .fold(0, (sum, transaction) => sum + int.parse(transaction.amount));
      int totalOutmoney = loadedTransactions
          .where((transaction) => transaction.type == 'Expense')
          .fold(0, (sum, transaction) => sum + int.parse(transaction.amount));
      setState(() {
        transactions = loadedTransactions;
        totalIncome = totalInmoney;
        totalExpense = totalOutmoney;
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
    return Container(
      height: getVerticalSize(312),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.06, -1.00),
          end: Alignment(0.06, 1),
          colors: [Color(0xFFFFF6E5), Color(0x00F7ECD7)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: getVerticalSize(12)),
            //profile row
            profile_row(),
            //account Balance
            account_balance(),
            SizedBox(height: getVerticalSize(27)),
            //Income and Expense
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  income_dispay_widget(
                    img: ImageConstant.imgincome,
                    text: 'Income',
                    amount: '₹' + totalIncome.toString(),
                    color: Color(0xFF00A86B),
                  ),
                  income_dispay_widget(
                    img: ImageConstant.imgexpense,
                    text: 'Expense',
                    amount: '₹' + totalExpense.toString(),
                    color: Color(0xFFFD3C4A),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class income_dispay_widget extends StatelessWidget {
  const income_dispay_widget({
    super.key,
    required this.img,
    required this.text,
    required this.amount,
    required this.color,
  });
  final String img;
  final String text;
  final String amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 18, bottom: 14, right: 11),
      width: getHorizontalSize(170),
      height: getVerticalSize(80),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: getHorizontalSize(48),
            height: getVerticalSize(48),
            decoration: ShapeDecoration(
              color: Color(0xFFFBFBFB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Center(child: SvgPicture.asset(img)),
          ),
          Container(
            width: getHorizontalSize(85),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: GoogleFonts.inter(
                    color: Color(0xFFFBFBFB),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Text(
                  amount,
                  style: GoogleFonts.inter(
                    color: Color(0xFFFBFBFB),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class account_balance extends StatelessWidget {
  const account_balance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(64),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Account Balance',
            style: GoogleFonts.inter(
              color: Color(0xFF90909F),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          Text(
            '₹38000',
            style: GoogleFonts.inter(
              color: Color(0xFF212224),
              fontSize: 40,
              fontWeight: FontWeight.w600,
              height: 0.09,
            ),
          ),
        ],
      ),
    );
  }
}

class profile_row extends StatelessWidget {
  const profile_row({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(64),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: getHorizontalSize(32),
            height: getVerticalSize(32),
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstant.imgprofilepic),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0xFFAD00FF),
                  blurRadius: 0,
                  offset: Offset(0, 0),
                  spreadRadius: 3,
                ),
                BoxShadow(
                  color: Color(0xFFF5F5F5),
                  blurRadius: 0,
                  offset: Offset(0, 0),
                  spreadRadius: 2,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            width: getHorizontalSize(107),
            height: getVerticalSize(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  ImageConstant.imgarrowdown2,
                  width: getHorizontalSize(14),
                  height: getVerticalSize(7),
                ),
                Text(
                  'October',
                  style: GoogleFonts.inter(
                    color: Color(0xFF212224),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 0.09,
                  ),
                ),
              ],
            ),
          ),
          Container(
              width: getHorizontalSize(32),
              height: getHorizontalSize(32),
              child: SvgPicture.asset(
                ImageConstant.imgnotification,
                fit: BoxFit.contain,
                width: getHorizontalSize(16),
                height: getHorizontalSize(16),
              ))
        ],
      ),
    );
  }
}
