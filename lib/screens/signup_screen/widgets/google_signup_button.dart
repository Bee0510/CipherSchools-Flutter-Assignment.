import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class google_signup_button extends StatelessWidget {
  const google_signup_button({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 343,
        height: 56,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFF1F1FA)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: SvgPicture.asset(
                'assets/image/google_icon.svg',
                width: 32,
                height: 32,
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 22,
              child: Text('Sign Up with Google',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF212224),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
