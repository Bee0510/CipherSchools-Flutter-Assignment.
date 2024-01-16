import 'package:cipher_schools/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterMenu extends StatefulWidget {
  const FilterMenu({Key? key}) : super(key: key);

  @override
  State<FilterMenu> createState() => _FilterMenuState();
}

class _FilterMenuState extends State<FilterMenu> {
  int _selectedIndex = 0;

  final _filterOptions = ['Today', 'Week', 'Month', 'Year'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: getHorizontalSize(346),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _filterOptions
              .mapIndexed((index, option) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        color: _selectedIndex == index
                            ? Color(0xFFFCEED3)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        option,
                        style: GoogleFonts.inter(
                          color: _selectedIndex == index
                              ? Color(0xFFFCAC12)
                              : Color(0xFF90909F),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
