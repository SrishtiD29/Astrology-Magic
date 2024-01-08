// ignore_for_file: camel_case_types, non_constant_identifier_names, depend_on_referenced_packages, avoid_print, unnecessary_string_interpolations, file_names

import 'package:astro_world/screens/home.dart';
import 'package:astro_world/services/panchang-api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class panchang_screen extends StatefulWidget {
  const panchang_screen({super.key});

  @override
  State<panchang_screen> createState() => _panchang_screenState();
}

class _panchang_screenState extends State<panchang_screen> {
  Map<String, dynamic> data = {};
  DateTime selectedDate = DateTime.now();

  Future<void> fetchData({required DateTime selectedDate}) async {
    final Map<String, dynamic> requestBody = {
      "day": selectedDate.day,
      "month": selectedDate.month,
      "year": selectedDate.year,
      "hour": selectedDate.hour,
      "min": selectedDate.minute,
      "lat": 28.535517,
      "lon": 77.391029,
      "tzone": 5.5
    };

    try {
      final http.Response response = await http.post(
        Uri.parse('https://json.astrologyapi.com/v1/advanced_panchang/sunrise'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'authorization':
              'Basic NjIwMDE1OmQ0ZTQzNTkwNmY4YmRhZjlhYTZiY2ZlOWY3ZjY0NzRk',
        },
        body: jsonEncode(requestBody),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

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
        print('Check again');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(selectedDate: selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Panchang',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ))
              ],
              leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const home_screen()));
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
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
              bottom: TabBar(isScrollable: true, indicatorWeight: 2, tabs: [
                Tab(
                  child: Text(
                    'Daily Panchang',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Festivals',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Planet Details',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Hora Mahurata',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Chaughadiya Mahurata',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Vedic Time',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ),
            body: true
                ? TabBarView(children: [
///////////////////////////////////////// DAILY PANCHANG ///////////////////////////////////////////////////
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 20, right: 10, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        DateTime? datePicked =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: selectedDate,
                                                firstDate: DateTime(2010),
                                                lastDate: DateTime(2030));

                                        if (datePicked != null) {
                                          setState(() {
                                            selectedDate = datePicked;
                                          });
                                          fetchData(selectedDate: selectedDate);
                                        }
                                      },
                                      child: Icon(
                                        Icons.calendar_month,
                                        size: 30,
                                        color: Color(0xFFFF6425),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        selectedDate != null
                                            ? DateFormat('dd MMMM, yyyy')
                                                .format(selectedDate)
                                            : 'Select a date',
                                        style: GoogleFonts.poppins(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width,
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
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 8),
                                    child: Text(
                                      'Panchang',
                                      style: GoogleFonts.poppins(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                          fontSize: 18),
                                    ),
                                  ),
                                  _daily_panchang(
                                    val1: 'Day : ',
                                    val2: data['day'].toString(),
                                  ),
                                  _daily_panchang(
                                    val1: 'Sunrise : ',
                                    val2: data['sunrise'].toString(),
                                  ),
                                  _daily_panchang(
                                      val1: 'Sunset : ',
                                      val2: data['sunset'].toString()),
                                  _daily_panchang(
                                    val1: 'Moonrise : ',
                                    val2: data['moonrise'].toString(),
                                  ),
                                  _daily_panchang(
                                      val1: 'Moonset : ',
                                      val2: data['moonset'].toString()),
                                  _daily_panchang(
                                      val1: 'Vedic Sunrise : ',
                                      val2: data['vedic_sunrise'].toString()),
                                  _daily_panchang(
                                      val1: 'Vedic Sunset : ',
                                      val2: data['vedic_sunset'].toString()),
                                  const SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width,
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
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 8),
                                    child: Text(
                                      'Additional Information',
                                      style: GoogleFonts.poppins(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                          fontSize: 18),
                                    ),
                                  ),
                                  _daily_panchang(
                                      val1: 'Tithi : ',
                                      val2: data['tithi']?['details']
                                                  ?['tithi_name']
                                              ?.toString() ??
                                          'N/A'),
                                  _daily_panchang(
                                      val1: 'Nakshatra : ',
                                      val2: data['nakshatra']?['details']
                                                  ?['nak_name']
                                              .toString() ??
                                          'N/A'),
                                  _daily_panchang(
                                    val1: 'Yog : ',
                                    val2: data['yog']?['details']?['yog_name']
                                            ?.toString() ??
                                        'N/A',
                                  ),
                                  _daily_panchang(
                                    val1: 'Karan : ',
                                    val2: data['karan']?['details']
                                                ?['karan_name']
                                            ?.toString() ??
                                        'N/A',
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width,
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
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 8),
                                    child: Text(
                                      'Hindu Month & Year',
                                      style: GoogleFonts.poppins(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                          fontSize: 18),
                                    ),
                                  ),
                                  _daily_panchang(
                                      val1: 'Vikram Samvat : ',
                                      val2:
                                          '${data['vikram_samvat'].toString()} - ${data['vkram_samvat_name'].toString()}'),
                                  _daily_panchang(
                                      val1: 'Shaka Samvat : ',
                                      val2:
                                          '${data['shaka_samvat'].toString()} - ${data['shaka_samvat_name'].toString()}'),
                                  _daily_panchang(
                                      val1: 'Paksha : ',
                                      val2: '${data['paksha'].toString()}'),
                                  _daily_panchang(
                                      val1: 'Ayana : ',
                                      val2: '${data['ayana'].toString()}'),
                                  _daily_panchang(
                                      val1: 'Purnimanta : ',
                                      val2: data['hindu_maah']?['purnimanta']
                                          .toString()),
                                  _daily_panchang(
                                      val1: 'Amanta : ',
                                      val2: data['hindu_maah']?['amanta']
                                          .toString()),
                                  _daily_panchang(
                                      val1: 'Sun Sign : ',
                                      val2: '${data['sun_sign'].toString()}'),
                                  _daily_panchang(
                                      val1: 'Moon Sign : ',
                                      val2: '${data['moon_sign'].toString()}'),
                                  const SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width,
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
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 8),
                                    child: Text(
                                      'Auspicious Time',
                                      style: GoogleFonts.poppins(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                          fontSize: 18),
                                    ),
                                  ),
                                  _daily_panchang(
                                      val1: 'Abhijit : ',
                                      val2:
                                          '${data['abhijit_muhurta']?['start'].toString()} - ${data['abhijit_muhurta']?['end'].toString()}'),
                                  const SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width,
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
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 8),
                                    child: Text(
                                      'Inauspicious Time',
                                      style: GoogleFonts.poppins(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                          fontSize: 18),
                                    ),
                                  ),
                                  _daily_panchang(
                                      val1: 'Rahu Kaal : ',
                                      val2:
                                          '${data['rahukaal']?['start'].toString()} - ${data['rahukaal']?['end'].toString()}'),
                                  _daily_panchang(
                                      val1: 'Guli Kaal : ',
                                      val2:
                                          '${data['guliKaal']?['start'].toString()} - ${data['guliKaal']?['end'].toString()}'),
                                  _daily_panchang(
                                      val1: 'Yamghant Kaal : ',
                                      val2:
                                          '${data['yamghant_kaal']?['start'].toString()} - ${data['yamghant_kaal']?['end'].toString()}'),
                                  const SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

////////////////////////////////////////////// FESTIVALS ///////////////////////////////////////////////////
                    DefaultTabController(
                      length: 12,
                      child: Column(
                        children: [
                          const TabBar(
                            isScrollable: true,
                            indicatorColor: Color.fromARGB(255, 231, 118, 52),
                            labelColor: Color.fromARGB(255, 231, 118, 52),
                            tabs: [
                              Tab(
                                text: 'January',
                              ),
                              Tab(
                                text: 'February',
                              ),
                              Tab(
                                text: 'March',
                              ),
                              Tab(
                                text: 'April',
                              ),
                              Tab(
                                text: 'May',
                              ),
                              Tab(
                                text: 'June',
                              ),
                              Tab(
                                text: 'July',
                              ),
                              Tab(
                                text: 'August',
                              ),
                              Tab(
                                text: 'September',
                              ),
                              Tab(
                                text: 'October',
                              ),
                              Tab(
                                text: 'November',
                              ),
                              Tab(
                                text: 'December',
                              ),
                              // Add more tabs as needed
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                      children: [_card(), _card(), _card()]),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                      children: [_card(), _card(), _card()]),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                      children: [_card(), _card(), _card()]),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                      children: [_card(), _card(), _card()]),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                      children: [_card(), _card(), _card()]),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                      children: [_card(), _card(), _card()]),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                      children: [_card(), _card(), _card()]),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                      children: [_card(), _card(), _card()]),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                      children: [_card(), _card(), _card()]),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                      children: [_card(), _card(), _card()]),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                      children: [_card(), _card(), _card()]),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                      children: [_card(), _card(), _card()]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                    )
                  ])
                : Container()));
  }

  _daily_panchang({required val1, required val2}) {
    print('val1: $val1, val2: $val2');
    return Padding(
        padding: const EdgeInsets.only(bottom: 5, left: 50),
        child: Table(children: [
          TableRow(
            children: [
              Text(
                val1,
                style: GoogleFonts.poppins(),
              ),
              Text(
                val2 != null ? val2.toString() : 'N/A',
                style: GoogleFonts.poppins(),
              )
            ],
          ),
        ]));
  }

  _card() {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Card(
        child: Column(
          children: [
            Image.network(
                'https://img.freepik.com/free-photo/traditional-indian-oil-lamps-diwali-festival-dark-background-traditional-festival-hindu_123827-28124.jpg?size=626&ext=jpg&ga=GA1.1.1001547711.1697544933&semt=sph'),
            Container(
              margin: const EdgeInsets.only(
                  top: 5, right: 10, left: 10, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Festival Name.....',
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
