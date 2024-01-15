// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cipher_schools/utils/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class statistic_section extends StatelessWidget {
  const statistic_section({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 268,
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
            SizedBox(height: 12),
            //profile row
            profile_row(),
            //account Balance
            account_balance(),
            SizedBox(height: 27),
            //Income and Expense
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  income_dispay_widget(
                    img: ImageConstant.imgincome,
                    text: 'Income',
                    amount: '₹50000',
                    color: Color(0xFF00A86B),
                  ),
                  income_dispay_widget(
                      img: ImageConstant.imgexpense,
                      text: 'Expense',
                      amount: '₹43000',
                      color: Color(0xFFFD3C4A)),
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
      width: 170,
      height: 80,
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
            width: 48,
            height: 48,
            decoration: ShapeDecoration(
              color: Color(0xFFFBFBFB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Center(child: SvgPicture.asset(img)),
          ),
          Column(
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
      height: 64,
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
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/32x32"),
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
            width: 107,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  ImageConstant.imgarrowdown2,
                  width: 14.15,
                  height: 7,
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
              width: 32,
              height: 32,
              child: SvgPicture.asset(
                ImageConstant.imgnotification,
                fit: BoxFit.contain,
                width: 16,
                height: 16,
              ))
        ],
      ),
    );
  }
}
