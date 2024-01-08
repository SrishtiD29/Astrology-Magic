// ignore_for_file: camel_case_types, file_names

import 'package:astro_world/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class reset_password extends StatefulWidget {
  const reset_password({super.key});

  @override
  State<reset_password> createState() => _reset_passwordState();
}

class _reset_passwordState extends State<reset_password> {
  TextEditingController emailController = TextEditingController();
  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Form(
            child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 590,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFFFFCB43),
                    Color(0xFFFF6425),
                    Color(0xFFFF0016),
                  ],
                  stops: [0.0, 0.37, 1.0],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Astrology Magic',
                        style: GoogleFonts.kaushanScript(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Reset Password',
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 28,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60, left: 40, right: 40),
              child: Column(
                children: [
                  TextFormField(
                    obscureText: true,
                    controller: emailController,
                    validator: _validateField,
                    decoration: const InputDecoration(
                        hintText: "Enter Your Old Password",
                        labelText: "Old Password",
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle(fontSize: 12),
                        labelStyle: TextStyle(fontSize: 13),
                        border: GradientOutlineInputBorder(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Color(0xFFFFCB43),
                                  Color(0xFFFF6425),
                                  Color(0xFFFF0016),
                                ]),
                            width: 2),
                        focusedBorder: GradientOutlineInputBorder(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color(0xFFFFCB43),
                                Color(0xFFFF6425),
                                Color(0xFFFF0016),
                              ],
                              stops: [0.0, 0.37, 1.0],
                            ),
                            width: 2)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    child: TextFormField(
                      obscureText: true,
                      validator: _validateField,
                      decoration: const InputDecoration(
                          hintText: "Enter Your New Password",
                          labelText: "New Password",
                          contentPadding: EdgeInsets.all(10.0),
                          hintStyle: TextStyle(fontSize: 12),
                          labelStyle: TextStyle(fontSize: 13),
                          border: GradientOutlineInputBorder(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Color(0xFFFFCB43),
                                    Color(0xFFFF6425),
                                    Color(0xFFFF0016),
                                  ]),
                              width: 2),
                          focusedBorder: GradientOutlineInputBorder(
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Color(0xFFFFCB43),
                                  Color(0xFFFF6425),
                                  Color(0xFFFF0016),
                                ],
                                stops: [0.0, 0.37, 1.0],
                              ),
                              width: 2)),
                    ),
                  ),
                  TextFormField(
                    validator: _validateField,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Rewrite Your New Password",
                        labelText: "Rewrite New Password",
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle(fontSize: 12),
                        labelStyle: TextStyle(fontSize: 13),
                        border: GradientOutlineInputBorder(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Color(0xFFFFCB43),
                                  Color(0xFFFF6425),
                                  Color(0xFFFF0016),
                                ]),
                            width: 2),
                        focusedBorder: GradientOutlineInputBorder(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color(0xFFFFCB43),
                                Color(0xFFFF6425),
                                Color(0xFFFF0016),
                              ],
                              stops: [0.0, 0.37, 1.0],
                            ),
                            width: 2)),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const home_screen()));
                      } else {
                        // If the form is not valid, inform the user to fill in required fields
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please fill in all required fields.'),
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color(0xFFFFCB43),
                              Color(0xFFFF6425),
                              Color(0xFFFF0016),
                            ],
                            stops: [0.0, 0.37, 1.0],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                        child: Text(
                          "Reset Password",
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyLarge,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 340,
              // margin: EdgeInsets.only(top: 132),
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(140),
                          topLeft: Radius.circular(140)),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xFFFFCB43),
                          Color(0xFFFF6425),
                          Color(0xFFFF0016),
                        ],
                        stops: [0.0, 0.37, 1.0],
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    height: 135,
                    width: 270,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 91),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          topLeft: Radius.circular(100)),
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [
                          Color(0xFFFFCB43),
                          Color(0xFFFF6425),
                          Color(0xFFFF0016),
                        ],
                        stops: [0.0, 0.37, 1.0],
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    height: 44,
                    width: 88,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
