// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:cipher_schools/screens/Home_screen/pages/budget_page.dart';
import 'package:cipher_schools/screens/Home_screen/pages/home_page/home_page.dart';
import 'package:cipher_schools/screens/Home_screen/pages/profile_page.dart';
import 'package:cipher_schools/screens/Home_screen/pages/transaction_page.dart';
import 'package:cipher_schools/screens/expense_screen/expense_screen.dart';
import 'package:cipher_schools/screens/income_screen/income_screen.dart';
import 'package:cipher_schools/utils/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class home_screen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<home_screen> {
  int selectedIndex = 0;

  List<Map<String, dynamic>> bottomNavigationBarItems = [
    {
      'icon': ImageConstant.imghome,
      'label': 'Menu',
      'page': home_page(),
    },
    {
      'icon': ImageConstant.imgtransaction,
      'label': 'Transaction',
      'page': transaction_page()
    },
    {
      'icon': ImageConstant.imgpiechart,
      'label': 'Budget',
      'page': budget_page()
    },
    {
      'icon': ImageConstant.imgprofile,
      'label': 'Profile',
      'page': profile_page()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: Color.fromRGBO(85, 0, 255, 1),
          onPressed: () => showPopupMenu(),
          child: SvgPicture.asset(ImageConstant.imgclose),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: 70,
          color: Color.fromRGBO(252, 252, 252, 1),
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(bottomNavigationBarItems.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(top: 11, bottom: 11, right: 10),
                child: InkWell(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        bottomNavigationBarItems[index]['icon'],
                        color: selectedIndex == index
                            ? Color.fromRGBO(85, 0, 255, 1)
                            : Color.fromRGBO(198, 198, 198, 1),
                        width: 23,
                        height: 23,
                      ),
                      SizedBox(height: 4),
                      Text(
                        bottomNavigationBarItems[index]['label'],
                        style: GoogleFonts.inter(
                          color: selectedIndex == index
                              ? Color.fromRGBO(85, 0, 255, 1)
                              : Color.fromRGBO(198, 198, 198, 1),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    _onItemTapped(index);
                  },
                ),
              );
            }),
          ),
        ),
        body: bottomNavigationBarItems[selectedIndex]['page'],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void showPopupMenu() {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(250, 590, 140, 70),
      items: [
        PopupMenuItem<String>(
          child: Center(child: Text('Income')),
          value: 'page1',
        ),
        PopupMenuItem<String>(
          child: Center(child: Text('Expense')),
          value: 'page2',
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value == 'page1') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => income_screen()),
        );
      } else if (value == 'page2') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => expense_screen()),
        );
      }
    });
  }
}
