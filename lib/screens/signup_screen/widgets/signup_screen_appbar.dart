// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class signup_screen_appbar extends StatelessWidget {
  const signup_screen_appbar({
    super.key,
    required this.title,
    required this.color,
  });
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 64,
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              'assets/image/left_arrow_android.svg',
              width: 24,
              height: 16,
              color: color,
            ),
          ),
          SizedBox(width: 30),
          SizedBox(
            width: 247,
            height: 32,
            child: Text(title,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: color,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 0,
                )),
          ),
        ],
      ),
    );
  }
}
