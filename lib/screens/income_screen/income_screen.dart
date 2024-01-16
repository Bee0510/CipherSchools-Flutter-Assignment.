// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:cipher_schools/components/button.dart';
import 'package:cipher_schools/screens/signup_screen/widgets/signup_screen_appbar.dart';
import 'package:cipher_schools/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../database/database.dart';
import '../../models/auth_model.dart';
import 'widgets/amount_input.dart';

class income_screen extends StatefulWidget {
  const income_screen({super.key});

  @override
  State<income_screen> createState() => _income_screenState();
}

class _income_screenState extends State<income_screen> {
  final transaction_base _database = transaction_base();
  final TextEditingController _amountComntroller = TextEditingController();
  final TextEditingController _descriptionComntroller = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  final TextEditingController walletController = TextEditingController();

  catagoryLabel? catagorySelect;
  walletLabel? walletSelect;
  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<catagoryLabel>> catagoryEntries =
        <DropdownMenuEntry<catagoryLabel>>[];
    for (final catagoryLabel icon in catagoryLabel.values) {
      catagoryEntries.add(
          DropdownMenuEntry<catagoryLabel>(value: icon, label: icon.label));
    }
    final List<DropdownMenuEntry<walletLabel>> walletEntries =
        <DropdownMenuEntry<walletLabel>>[];
    for (final walletLabel icon in walletLabel.values) {
      walletEntries
          .add(DropdownMenuEntry<walletLabel>(value: icon, label: icon.label));
    }

    final user = Provider.of<Users>(context);
    return Scaffold(
      backgroundColor: Color(0xFF7B61FF),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: getVerticalSize(30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: signup_screen_appbar(
                  title: 'Income',
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: getVerticalSize(228),
              left: getHorizontalSize(24),
              child: Container(
                child: Text(
                  'How much?',
                  style: GoogleFonts.inter(
                    color: Color(0xFFFBFBFB),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              top: getVerticalSize(263),
              left: getHorizontalSize(24),
              child: Text(
                '₹',
                style: GoogleFonts.inter(
                  color: Color(0xFFFBFBFB),
                  fontSize: 64,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            amount_input(amountComntroller: _amountComntroller),
            Positioned(
              top: getVerticalSize(369),
              left: 4,
              right: 4,
              child: Container(
                height: getVerticalSize(320),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                ),
                child: Center(
                  child: Container(
                    height: getVerticalSize(272),
                    width: getHorizontalSize(343),
                    child: Column(
                      children: [
                        // Catagory
                        DropdownMenu<catagoryLabel>(
                          controller: iconController,
                          width: getHorizontalSize(343),
                          enableFilter: true,
                          label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Catagory',
                              style: GoogleFonts.inter(
                                color: Color(0xFF90909F),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 0.07,
                              ),
                            ),
                          ),
                          textStyle: GoogleFonts.inter(
                            color: Color(0xFF90909F),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0.07,
                          ),
                          dropdownMenuEntries: catagoryEntries,
                          inputDecorationTheme: const InputDecorationTheme(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(color: Color(0xFFF1F1FA)),
                            ),
                            filled: false,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide: BorderSide(
                                    color: Color(0xFFF1F1FA), width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide: BorderSide(
                                    color: Color(0xFFF1F1FA), width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide: BorderSide(
                                    color: Color(0xFFF1F1FA), width: 1)),
                            contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          onSelected: (catagoryLabel? icon) {
                            setState(() {
                              catagorySelect = icon;
                            });
                          },
                        ),
                        SizedBox(height: getVerticalSize(16)),
                        //Description
                        Container(
                          height: getVerticalSize(56),
                          child: TextFormField(
                            controller: _descriptionComntroller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              labelStyle: GoogleFonts.inter(
                                color: Color(0xFF90909F),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 0.07,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      color: Color(0xFFF1F1FA), width: 1)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      color: Color(0xFFF1F1FA), width: 1)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      color: Color(0xFFF1F1FA), width: 1)),
                            ),
                            style: GoogleFonts.inter(
                              color: Color(0xFF90909F),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 0.07,
                            ),
                          ),
                        ),
                        SizedBox(height: getVerticalSize(16)),
                        //Wallet
                        DropdownMenu<walletLabel>(
                          controller: walletController,
                          width: getHorizontalSize(343),
                          enableFilter: true,
                          label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Wallet',
                              style: GoogleFonts.inter(
                                color: Color(0xFF90909F),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 0.07,
                              ),
                            ),
                          ),
                          textStyle: GoogleFonts.inter(
                            color: Color(0xFF90909F),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0.07,
                          ),
                          dropdownMenuEntries: walletEntries,
                          inputDecorationTheme: const InputDecorationTheme(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(color: Color(0xFFF1F1FA)),
                            ),
                            filled: false,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide: BorderSide(
                                    color: Color(0xFFF1F1FA), width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide: BorderSide(
                                    color: Color(0xFFF1F1FA), width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide: BorderSide(
                                    color: Color(0xFFF1F1FA), width: 1)),
                            contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          onSelected: (walletLabel? icon) {
                            setState(() {
                              walletSelect = icon;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: getVerticalSize(690),
                left: getHorizontalSize(4),
                right: getHorizontalSize(4),
                child: Container(
                  width: 375,
                  height: 94,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: button(
                        onPressed: () async {
                          try {
                            if (_amountComntroller.text.isEmpty ||
                                catagorySelect == null ||
                                walletSelect == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please fill all the fields'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              return;
                            }
                            await _database.incomeRequest(
                              user,
                              _amountComntroller.text,
                              _descriptionComntroller.text,
                              catagorySelect!.label,
                              walletSelect!.label,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            Timer(Duration(seconds: 1), () {
                              Navigator.pop(context);
                            });
                          } catch (e) {
                            print("Firestore Error: $e");
                          }
                        },
                        title: 'Continue'),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

enum catagoryLabel {
  smile('Shopping', Icons.sentiment_satisfied_outlined),
  cloud(
    'Subscription',
    Icons.cloud_outlined,
  ),
  brush('Travel', Icons.brush_outlined),
  heart('Food', Icons.favorite),
  mumbai('Enterntainment', Icons.favorite);

  const catagoryLabel(this.label, this.icon);
  final String label;
  final IconData icon;
}

enum walletLabel {
  smile('UPI', Icons.sentiment_satisfied_outlined),
  cloud(
    'Debit Card',
    Icons.cloud_outlined,
  ),
  brush('Credit Card', Icons.brush_outlined),
  heart('Net Banking', Icons.favorite),
  mumbai('Others', Icons.favorite);

  const walletLabel(this.label, this.icon);
  final String label;
  final IconData icon;
}
