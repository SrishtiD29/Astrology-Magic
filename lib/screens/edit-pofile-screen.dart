// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class edit_profile extends StatefulWidget {
  const edit_profile({super.key});

  @override
  State<edit_profile> createState() => edit_profileState();
}

class edit_profileState extends State<edit_profile> {
  TextEditingController emailController = TextEditingController();
  String dropdown_value = "Dehradun";
  var dropdown_item = ["Dehradun", "Delhi", "Noida", "Kolkata"];

  String dropdown_value_2 = "India";
  var dropdown_item_2 = ["India", "Russia", "Australia", "USA"];

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
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.215,
                  margin: EdgeInsets.only(top: 35),
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
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, top: 100),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 65,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  color: Colors.white),
                            ],
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
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Name",
                              style: GoogleFonts.poppins(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            Text(
                              "Phone Number",
                              style: GoogleFonts.poppins(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, top: 20),
              child: Column(children: [
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null; // Return null if the input is valid
                  },
                  decoration: const InputDecoration(
                      hintText: "Enter Your Email",
                      labelText: "Email Address",
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
                    validator: _validateField,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle(fontSize: 12),
                        labelStyle: TextStyle(fontSize: 13),
                        hintText: "Enter Your Password",
                        labelText: "Password",
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
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: TextFormField(
                    validator: _validateField,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle(fontSize: 12),
                        labelStyle: TextStyle(fontSize: 13),
                        hintText: "Enter Your Phone Number",
                        labelText: "Phone Number",
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
                DropdownButtonHideUnderline(
                  child: SizedBox(
                    height: 58,
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
                        color: Color.fromARGB(255, 85, 84, 84),
                      ),
                      items: dropdown_item.map((String dropDownItem) {
                        return DropdownMenuItem(
                          value: dropDownItem,
                          child: Text(
                            dropDownItem,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
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
                SizedBox(
                  height: 10,
                ),
                DropdownButtonHideUnderline(
                  child: SizedBox(
                    height: 58,
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
                      value: dropdown_value_2,
                      dropdownColor: Colors.white,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color.fromARGB(255, 85, 84, 84),
                      ),
                      items: dropdown_item_2.map((String dropDownItem) {
                        return DropdownMenuItem(
                          value: dropDownItem,
                          child: Text(
                            dropDownItem,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 85, 84, 84),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdown_value_2 = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
