// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cipher_schools/database/database.dart';
import 'package:cipher_schools/utils/image_constant.dart';
import 'package:cipher_schools/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../../../models/database_model.dart';

class transaction_section extends StatefulWidget {
  const transaction_section({super.key, required this.data});

  final List<transaction> data;

  @override
  State<transaction_section> createState() => _transaction_sectionState();
}

class _transaction_sectionState extends State<transaction_section> {
  final transaction_base _database = transaction_base();
  @override
  Widget build(BuildContext context) {
    print('data: ${widget.data.length}');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Padding(
        padding: const EdgeInsets.only(left: 11, right: 28),
        child: widget.data.isEmpty
            ? Center(
                child: widget.data.isNotEmpty
                    ? CircularProgressIndicator()
                    : Text('No Transactions'),
              )
            : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: widget.data.length,
                itemBuilder: (context, i) {
                  String imgSelector() {
                    if (widget.data[i].catagory == 'Food') {
                      return ImageConstant.imgfood;
                    } else if (widget.data[i].catagory == 'Shopping') {
                      return ImageConstant.imgshoppingbag;
                    } else if (widget.data[i].catagory == 'Travel') {
                      return ImageConstant.imgtravel;
                    } else if (widget.data[i].catagory == 'Health') {
                      return ImageConstant.imgedit;
                    } else if (widget.data[i].catagory == 'Entertainment') {
                      return ImageConstant.imghome;
                    } else if (widget.data[i].catagory == 'Subscription') {
                      return ImageConstant.imgsubscription;
                    } else if (widget.data[i].catagory == 'Other') {
                      return ImageConstant.imguplaod;
                    } else {
                      return ImageConstant.imgwallet;
                    }
                  }

                  Color colorSelector() {
                    if (widget.data[i].catagory == 'Food') {
                      return Color(0xFFFDD4D7);
                    } else if (widget.data[i].catagory == 'Shopping' ||
                        widget.data[i].catagory == 'Entertainment') {
                      return Color(0xFFFCEED3);
                    } else if (widget.data[i].catagory == 'Travel' ||
                        widget.data[i].catagory == 'Health') {
                      return Color(0xFFF1F1FA);
                    } else if (widget.data[i].catagory == 'Subscription' ||
                        widget.data[i].catagory == 'Other') {
                      return Color(0xFFEEE5FF);
                    } else {
                      return Color(0xFFFCEED3);
                    }
                  }

                  String formattedTime = DateFormat('HH:mm a').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          widget.data[i].date.millisecondsSinceEpoch));
                  return Dismissible(
                    key: Key(widget.data[i].Transaction_id),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20.0),
                      child: Center(
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    background: Container(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) async {
                      if (direction == DismissDirection.endToStart) {
                        await _database
                            .deleteIncome(widget.data[i].Transaction_id);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Item Deleted Successfully'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Container(
                        padding: EdgeInsets.only(
                            left: 17, right: 16, top: 14, bottom: 15),
                        height: getVerticalSize(89),
                        decoration: ShapeDecoration(
                          color: Color(0xFFFBFBFB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: getHorizontalSize(60),
                              height: getHorizontalSize(60),
                              padding: const EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                color: colorSelector(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: SvgPicture.asset(
                                imgSelector(),
                                width: getHorizontalSize(40),
                                height: getVerticalSize(40),
                              ),
                            ),
                            SizedBox(width: getSize(10)),
                            //details
                            Container(
                              width: getHorizontalSize(250),
                              height: getVerticalSize(60),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: getVerticalSize(60),
                                    // padding:
                                    //     const EdgeInsets.symmetric(vertical: 6),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.data[i].catagory,
                                          style: TextStyle(
                                            color: Color(0xFF292B2D),
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        const SizedBox(height: 11),
                                        Expanded(
                                          child: Container(
                                            height: getVerticalSize(16),
                                            width: getHorizontalSize(115),
                                            child: Text(
                                              widget.data[i].description,
                                              style: TextStyle(
                                                color: Color(0xFF90909F),
                                                fontSize: 13,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 9),
                                  Container(
                                    height: getVerticalSize(60),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          widget.data[i].type == 'Income'
                                              ? '+ ₹${widget.data[i].amount}'
                                              : '- ₹${widget.data[i].amount}',
                                          style: TextStyle(
                                            color:
                                                widget.data[i].type == 'Income'
                                                    ? Color(0xFF00A86B)
                                                    : Color(0xFFFD3C4A),
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                        SizedBox(height: getVerticalSize(4)),
                                        Text(
                                          formattedTime,
                                          style: TextStyle(
                                            color: Color(0xFF90909F),
                                            fontSize: 13,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  );
                }),
      ),
    );
  }
}
