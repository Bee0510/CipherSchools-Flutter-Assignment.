// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:cipher_schools/auth/auth.dart';
import 'package:cipher_schools/utils/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class profile_page extends StatefulWidget {
  const profile_page({super.key});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  final Authentication _auth = Authentication();
  final List<Map<String, dynamic>> dataList = [
    {"icon": ImageConstant.imgwallet, "title": "Account"},
    {"icon": ImageConstant.imgsettings, "title": "Settings"},
    {"icon": ImageConstant.imguplaod, "title": "Export Data"},
    {"icon": ImageConstant.imglogout, "title": "Logout"},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(246, 246, 246, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            profile_section(),
            SizedBox(height: 40),
            //Listview
            Container(
              width: 336,
              height: 356,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: 2,
                      ),
                      child: InkWell(
                        onTap: () async {
                          await _auth.signOutFromGoogle();
                        },
                        child: Container(
                          width: 336,
                          height: 89,
                          padding: EdgeInsets.only(
                            top: 18,
                            bottom: 19,
                            left: 17,
                          ),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: i == 0
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                    )
                                  : i == 3
                                      ? BorderRadius.only(
                                          bottomLeft: Radius.circular(24),
                                          bottomRight: Radius.circular(24),
                                        )
                                      : BorderRadius.zero,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 52,
                                height: 52,
                                padding: const EdgeInsets.all(10),
                                decoration: ShapeDecoration(
                                  color: Color(0xFFEEE5FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  dataList[i]["icon"],
                                  width: 32,
                                  height: 32,
                                ),
                              ),
                              SizedBox(width: 9),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dataList[i]["title"],
                                      style: GoogleFonts.inter(
                                        color: Color(0xFF292B2D),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class profile_section extends StatelessWidget {
  const profile_section({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstant.imgprofilepic),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0xFFAD00FF),
                  blurRadius: 0,
                  offset: Offset(0, 0),
                  spreadRadius: 6,
                ),
                BoxShadow(
                  color: Color(0xFFF5F5F5),
                  blurRadius: 0,
                  offset: Offset(0, 0),
                  spreadRadius: 4,
                )
              ],
            ),
          ),
          SizedBox(width: 19),
          Container(
            height: 50,
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Username',
                  style: GoogleFonts.inter(
                    color: Color(0xFF90909F),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Text('Khusi Sharma',
                    style: GoogleFonts.inter(
                      color: Color(0xFF161719),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    )),
              ],
            ),
          ),
          SizedBox(width: 20),
          Container(
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(ImageConstant.imgedit),
            ),
          )
        ],
      ),
    );
  }
}
