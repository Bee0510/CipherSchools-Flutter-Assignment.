// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:cipher_schools/screens/Home_screen/home_screen.dart';
import 'package:cipher_schools/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_model.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);

    if (user == null) {
      return Signup_screen();
    } else {
      return home_screen();
    }
  }
}
