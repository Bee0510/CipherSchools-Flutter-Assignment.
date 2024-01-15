// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';
import 'package:cipher_schools/screens/getting_started/getting_started.dart';
import 'package:cipher_schools/utils/color_constant.dart';
import 'package:cipher_schools/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => getting_started()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primarycolor,
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 629,
            left: 203,
            child: Image.asset(
              'assets/image/ringhtopcorner.png',
              width: 250,
              height: 250,
            ),
          ),
          Positioned(
            top: 666,
            right: 218,
            child: Image.asset(
              'assets/image/leftbottomcorner.png',
              width: 250,
              height: 250,
            ),
          ),
          Positioned(
            top: getSize(287),
            left: getFontSize(150),
            child: Image.asset(
              'assets/image/icon.png',
              width: 112,
              height: 112,
            ),
          ),
          Positioned(
            top: 760,
            right: 311,
            child: Image.asset(
              'assets/image/centerbottom.png',
              width: 112,
              height: 112,
            ),
          ),
          Positioned(
            bottom: 730,
            left: 304,
            child: Transform.rotate(
              angle: pi,
              child: Image.asset(
                'assets/image/centerbottom.png',
                width: 112,
                height: 112,
              ),
            ),
          ),
          Positioned(
            top: getSize(436),
            left: getFontSize(89),
            child: SizedBox(
              width: 234,
              height: 43,
              child: Text(
                'CipherX',
                textAlign: TextAlign.center,
                style: GoogleFonts.brunoAceSc(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: -0.72,
                ),
              ),
            ),
          ),
          Positioned(
              top: 736,
              left: 127,
              child: Container(
                width: 158,
                height: 48,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'By\nOpen Source ',
                        style: GoogleFonts.cambay(
                          color: Colors.white.withOpacity(0.5400000214576721),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: -0.30,
                        ),
                      ),
                      TextSpan(
                        text: 'Community',
                        style: GoogleFonts.cambay(
                          color: Color(0xFFF7A301),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ))
        ],
      ),
    );
  }
}
