// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:cipher_schools/utils/color_constant.dart';
import 'package:cipher_schools/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'widgets/welcome_widget.dart';

class getting_started extends StatefulWidget {
  const getting_started({Key? key});

  @override
  State<getting_started> createState() => _splash_screenState();
}

class _splash_screenState extends State<getting_started> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primarycolor,
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: getVerticalSize(609),
            left: getHorizontalSize(203),
            child: Image.asset(
              'assets/image/ringhtopcorner.png',
              width: 250,
              height: 250,
            ),
          ),
          Positioned(
            top: getVerticalSize(666),
            right: getHorizontalSize(218),
            child: Image.asset(
              'assets/image/leftbottomcorner.png',
              width: getSize(250),
              height: getFontSize(250),
            ),
          ),
          Positioned(
            top: getSize(48),
            left: getFontSize(20),
            child: Image.asset(
              'assets/image/icon.png',
              width: 60,
              height: 60,
            ),
          ),
          Positioned(
            top: getVerticalSize(760),
            right: getHorizontalSize(311),
            child: Image.asset(
              'assets/image/centerbottom.png',
              width: getSize(112),
              height: getSize(112),
            ),
          ),
          Positioned(
            bottom: getVerticalSize(730),
            left: getHorizontalSize(304),
            child: Transform.rotate(
              angle: pi,
              child: Image.asset(
                'assets/image/centerbottom.png',
                width: getSize(112),
                height: getSize(112),
              ),
            ),
          ),
          welcome_widget()
        ],
      ),
    );
  }
}
