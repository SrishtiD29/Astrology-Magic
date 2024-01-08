// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_final_fields, file_names

import 'package:astro_world/screens/home.dart';
import 'package:astro_world/screens/login-screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  TextEditingController emailController = TextEditingController();

  String dropdown_value = "Female";
  var dropdown_item = ["Female", "Male"];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
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
                          'Create Account',
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
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 20, right: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      // height: 50,
                      child: IntrinsicHeight(
                        child: TextFormField(
                          validator: _validateField,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            labelText: "First Name",
                            hintText: "Enter Your First Name",
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
                                ],
                                stops: [0.0, 0.37, 1.0],
                              ),
                              width: 2,
                            ),
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
                                width: 2),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        validator: _validateField,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          labelText: "Last Name",
                          labelStyle: TextStyle(fontSize: 13),
                          hintText: "Enter Your Last Name",
                          hintStyle: TextStyle(fontSize: 12),
                          border: GradientOutlineInputBorder(
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
                            width: 2,
                          ),
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
                              width: 2),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field is required';
                          } else if (!RegExp(
                                  r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null; // Return null if the input is valid
                        },
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            hintText: "Enter Your Email",
                            hintStyle: TextStyle(fontSize: 12),
                            labelText: "Email Address",
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
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      child: TextFormField(
                        validator: _validateField,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            hintText: "Enter Your Phone Number",
                            hintStyle: TextStyle(fontSize: 12),
                            labelText: "Phone Number",
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
                    SizedBox(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            border: GradientOutlineInputBorder(
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
                              width: 2,
                            ),
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
                              width: 2,
                            ),
                          ),
                          value: dropdown_value,
                          dropdownColor: Colors.white,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                            color: Color.fromARGB(255, 85, 84, 84),
                          ),
                          items: dropdown_item.map((String dropDownItem) {
                            return DropdownMenuItem(
                              value: dropDownItem,
                              child: Text(
                                dropDownItem,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 85, 84, 84),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdown_value = newValue!;
                            });
                          },
                        ),
                      ),
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
                            SnackBar(
                              content: Text(
                                'Please fill in all required fields.',
                                style: GoogleFonts.poppins(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    color: Colors.white),
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 40,
                        ),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            "Create Account",
                            style: GoogleFonts.poppins(
                                textStyle:
                                    Theme.of(context).textTheme.bodyLarge,
                                fontSize: 19,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: GoogleFonts.poppins(
                                fontSize: 13,
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const login_screen()));
                            },
                            child: Text(
                              'LOGIN',
                              style: GoogleFonts.poppins(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  color:
                                      const Color.fromARGB(255, 32, 90, 248)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
