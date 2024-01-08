// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:astro_world/screens/home.dart';
import 'package:astro_world/screens/horoscopes.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class daily_horoscope extends StatefulWidget {
  const daily_horoscope({
    Key? key,
    required this.onDataReceived,
    required this.data,
  }) : super(key: key);

  final Function(Map<String, dynamic> data) onDataReceived;
  final Map<String, dynamic> data;

  @override
  State<daily_horoscope> createState() => _daily_horoscopeState();
}

class _daily_horoscopeState extends State<daily_horoscope> {
  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    data = widget.data;
    widget.onDataReceived(data);
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
          'Daily Horoscope',
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
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const horoscopes()));
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              height: MediaQuery.of(context).size.height - 710,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: const GradientBoxBorder(
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
                    width: 2.5),
              ),
              child: Center(
                  child: Text(
                "Today's Horoscope",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 16),
              )),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
              padding: const EdgeInsets.only(left: 10, top: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Text(
                    '----${data['sun_sign']}----',
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Date :- ${data['prediction_date']}",
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 17),
                        child: Text(
                          'Your Daily Horoscope is ready !',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Lucky Colours',
                            style: GoogleFonts.poppins(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Mood of Day',
                            style: GoogleFonts.poppins(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Blue , Red',
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                            Text(
                              'Happy',
                              style: GoogleFonts.poppins(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Lucky Number',
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Lucky Time',
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 20, left: 80, right: 47),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '09',
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                            Text(
                              '12:40 P.M',
                              style: GoogleFonts.poppins(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                'Daily Horoscope',
                style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    fontSize: 18),
              ),
            ),
            _horoscope(
                val1: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                val2: 'Personal Life',
                val3: '80%',
                val4: data['prediction']?['personal_life']),
            _horoscope(
                val1: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                val2: 'Emotions',
                val3: '80%',
                val4: data['prediction']?['emotions']),
            _horoscope(
                val1: const Icon(
                  Icons.work,
                  color: Colors.grey,
                ),
                val2: 'Profession',
                val3: '100%',
                val4: data['prediction']?['profession']),
            _horoscope(
                val1: const Icon(
                  Icons.money,
                  color: Colors.green,
                ),
                val2: 'Luck',
                val3: '50%',
                val4: data['prediction']?['luck']),
            _horoscope(
                val1: const Icon(
                  Icons.health_and_safety,
                  color: Colors.red,
                ),
                val2: 'Health',
                val3: '70%',
                val4: data['prediction']?['health']),
            _horoscope(
                val1: const Icon(
                  Icons.flight,
                  color: Colors.purple,
                ),
                val2: 'Travel',
                val3: '30%',
                val4: data['prediction']?['travel'])
          ],
        ),
      ),
    );
  }

  _horoscope({required val1, required val2, required val3, required val4}) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: const GradientBoxBorder(
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
            width: 1.5),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: Column(
          children: [
            ListTile(
              leading: val1,
              title: Text(
                val2,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 14),
              ),
              trailing: Text(
                val3,
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: Text(
                val4 != null ? val4.toString() : 'N/A',
                style: GoogleFonts.poppins(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
