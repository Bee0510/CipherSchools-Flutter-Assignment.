// ignore_for_file: prefer_final_fields, library_private_types_in_public_api, prefer_const_constructors

import 'package:cipher_schools/components/button.dart';
import 'package:cipher_schools/screens/signup_screen/widgets/google_signup_button.dart';
import 'package:cipher_schools/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../auth/auth.dart';
import 'widgets/signup_screen_appbar.dart';

class Signup_screen extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<Signup_screen> {
  final _formKey = GlobalKey<FormState>();
  final Authentication _authentication = Authentication();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isTermsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(width: 44),
                signup_screen_appbar(
                  title: 'Sign Up',
                  color: Color(0xFF212224),
                ),
                SizedBox(height: 56),
                textField(
                  nameController: _nameController,
                  label: 'Name',
                  hide: false,
                ),
                SizedBox(height: 24),
                textField(
                  nameController: _emailController,
                  label: 'Email',
                  hide: false,
                ),
                SizedBox(height: 24.0),
                textField(
                  nameController: _passwordController,
                  label: 'Password',
                  hide: true,
                ),
                SizedBox(height: 17.0),
                Row(
                  children: [
                    Checkbox(
                      value: _isTermsChecked,
                      onChanged: (value) {
                        setState(() {
                          _isTermsChecked = value ?? false;
                        });
                      },
                    ),
                    Container(
                        width: 291,
                        height: 36,
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                            text: 'By signing up, you agree to the ',
                            style: GoogleFonts.inter(
                              color: Color(0xFF90909F),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms of Service and Privacy Policy',
                            style: GoogleFonts.inter(
                              color: Color(0xFF7E3DFF),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                            ),
                          ),
                        ]))),
                  ],
                ),
                SizedBox(height: 27.0),
                button(onPressed: () {}, title: 'Sign Up'),
                SizedBox(height: 12.0),
                Container(
                  height: 18,
                  child: Text('Or with',
                      style: GoogleFonts.inter(
                        color: Color(0xFF90909F),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 0.09,
                      )),
                ),
                SizedBox(height: 12),
                google_signup_button(
                  onPressed: () async {
                    await _authentication.signInwithGoogle();
                  },
                ),
                SizedBox(height: 19),
                Container(
                  height: 19,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Already have an account? ',
                            style: GoogleFonts.inter(
                              color: Color(0xFF90909F),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 0.09,
                            )),
                        TextSpan(
                            text: 'Login',
                            style: GoogleFonts.inter(
                                color: Color(0xFF7E3DFF),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                height: 0.09,
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class textField extends StatelessWidget {
  textField({
    super.key,
    required TextEditingController nameController,
    required this.hide,
    required this.label,
  }) : _nameController = nameController;

  final TextEditingController _nameController;
  final String label;
  bool hide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 56,
      child: TextFormField(
        controller: _nameController,
        obscureText: hide,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        validator: (val) {
          if (val!.isEmpty) {
            return 'Please enter your ${val}';
          }
          return null;
        },
      ),
    );
  }
}
