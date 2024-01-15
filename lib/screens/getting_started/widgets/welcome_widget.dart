// ignore_for_file: prefer_const_constructors

import 'package:cipher_schools/auth/wrapper.dart';
import 'package:cipher_schools/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class welcome_widget extends StatelessWidget {
  welcome_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 604,
        left: 17,
        child: Container(
          width: 346,
          height: 141,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 58,
                child: SizedBox(
                  width: 234,
                  child: Text(
                    'CipherX.',
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
                left: 11,
                top: 117,
                child: Text(
                  'The best way to track your expenses.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aBeeZee(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: -0.40,
                  ),
                ),
              ),
              Positioned(
                left: 9,
                top: 0,
                child: Text(
                  'Welcome to  ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aBeeZee(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: -0.80,
                  ),
                ),
              ),
              Positioned(
                left: 260,
                top: 11,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Wrapper()));
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: ShapeDecoration(
                      color: Color(0xBFECE1E1),
                      shape: OvalBorder(),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/image/right_arrow_icon.svg',
                        width: 25,
                        height: 48,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
