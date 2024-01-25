// ignore_for_file: prefer_final_fields, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:astro_world/screens/home.dart';
import 'package:astro_world/screens/kundali_1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:http/http.dart' as http;

class kundali_screen extends StatefulWidget {
  const kundali_screen({Key? key}) : super(key: key);

  @override
  State<kundali_screen> createState() => _kundali_screenState();
}

class _kundali_screenState extends State<kundali_screen> {
  String? name;
  String? dob;
  String? gender;
  String? birthTime;
  String? birthPlace;

  String dropdown_value_2 = "Female";
  var dropdown_item_2 = ["Female", "Male"];

  Map<String, dynamic> data = {};
  Future<void> fetchData() async {
    final Map<String, dynamic> requestBody = {
      "day": 15,
      "month": 8,
      "year": 1998,
      "hour": 3,
      "min": 15,
      "lat": 28.535517,
      "lon": 77.391029,
      "tzone": 5.5
    };
    try {
      final http.Response response = await http.post(
        Uri.parse('https://apis.sanatanjyoti.com/kundali/get_birth_details'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      print('Response Body: ${response.body}');
      print('Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        setState(() {
          data = Map<String, dynamic>.from(jsonDecode(response.body));
        });

        final bool success = data.isNotEmpty;
        if (success) {
          print('Successful');
        } else {
          print('Not Successful');
        }
      } else {
        print('Check Again');
      }
    } catch (e) {
      print('Error $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
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
          title: const Text(
            'Kundali',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ))
          ],
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const home_screen()));
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                'Enter Details',
                style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 1.2),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, top: 20),
              child: Column(children: [
                TextFormField(
                  validator: _validate,
                  onChanged: (text) {
                    name = text;
                  },
                  decoration: const InputDecoration(
                      hintText: "Enter Your Name",
                      labelText: "Name",
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
                const SizedBox(
                  height: 20,
                ),
                // DropdownButtonHideUnderline(
                //   child: SizedBox(
                //     height: 58,
                //     child: DropdownButtonFormField(
                //       decoration: const InputDecoration(
                //         contentPadding: EdgeInsets.all(10.0),
                //         border: GradientOutlineInputBorder(
                //           gradient: LinearGradient(
                //             begin: Alignment.bottomLeft,
                //             end: Alignment.topRight,
                //             colors: [
                //               Color(0xFFFFCB43),
                //               Color(0xFFFF6425),
                //               Color(0xFFFF0016),
                //             ],
                //             stops: [0.0, 0.37, 1.0],
                //           ),
                //           width: 2,
                //         ),
                //         focusedBorder: GradientOutlineInputBorder(
                //           gradient: LinearGradient(
                //             begin: Alignment.bottomLeft,
                //             end: Alignment.topRight,
                //             colors: [
                //               Color(0xFFFFCB43),
                //               Color(0xFFFF6425),
                //               Color(0xFFFF0016),
                //             ],
                //             stops: [0.0, 0.37, 1.0],
                //           ),
                //           width: 2,
                //         ),
                //       ),
                //       value: dropdown_value_2,
                //       dropdownColor: Colors.white,
                //       icon: const Icon(
                //         Icons.keyboard_arrow_down,
                //         color: Color.fromARGB(255, 85, 84, 84),
                //       ),
                //       items: dropdown_item_2.map((String dropDownItem) {
                //         return DropdownMenuItem(
                //           value: dropDownItem,
                //           child: Text(
                //             dropDownItem,
                //             style: const TextStyle(
                //               fontSize: 13,
                //               fontWeight: FontWeight.w400,
                //               color: Color.fromARGB(255, 85, 84, 84),
                //             ),
                //           ),
                //         );
                //       }).toList(),
                //       onChanged: (String? newValue) {
                //         setState(() {
                //           dropdown_value_2 = newValue!;
                //         });
                //       },
                //     ),
                //   ),
                // ),
                TextFormField(
                  onChanged: (text) {
                    gender = text;
                  },
                  decoration: const InputDecoration(
                      hintText: "Enter Your Gender",
                      labelText: "Gender",
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
                    bottom: 10,
                  ),
                  child: TextFormField(
                    onChanged: (text) {
                      dob = text;
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle(fontSize: 12),
                        labelStyle: TextStyle(fontSize: 13),
                        hintText: "Enter Your DOB",
                        labelText: "DOB",
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
                    top: 10,
                    bottom: 20,
                  ),
                  child: TextFormField(
                    onChanged: (text) {
                      birthTime = text;
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle(fontSize: 12),
                        labelStyle: TextStyle(fontSize: 13),
                        hintText: "Enter Your Birth Time",
                        labelText: "Birth Time",
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
                    onChanged: (text) {
                      birthPlace = text;
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle(fontSize: 12),
                        labelStyle: TextStyle(fontSize: 13),
                        hintText: "Enter Your Birth Place",
                        labelText: "Birth Place",
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _validate;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => kundali_1(
                                  name: name.toString(),
                                  gender: gender.toString(),
                                  dob: dob.toString(),
                                  birthTime: birthTime.toString(),
                                  birthPlace: birthPlace.toString(),
                                  onReceivedData:
                                      (Map<String, dynamic> data) {},
                                  data: data,
                                )));
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
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        "Next",
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 19,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ]),
            )
          ]),
        )));
  }
}
