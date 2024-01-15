import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class amount_input extends StatelessWidget {
  const amount_input({
    super.key,
    required TextEditingController amountComntroller,
  }) : _amountComntroller = amountComntroller;

  final TextEditingController _amountComntroller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 250,
      left: 65,
      child: Container(
        width: double.maxFinite,
        color: Colors.amber,
        child: TextFormField(
          controller: _amountComntroller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '0',
            hintStyle: GoogleFonts.inter(
              color: Color(0xFFFBFBFB),
              fontSize: 64,
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          style: GoogleFonts.inter(
            color: Color(0xFFFBFBFB),
            fontSize: 64,
            fontWeight: FontWeight.w600,
            height: 0,
          ),
          onChanged: (value) {
            // You can add any logic here if needed
          },
        ),
      ),
    );
  }
}
