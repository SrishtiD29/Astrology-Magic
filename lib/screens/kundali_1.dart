import 'package:astro_world/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class kundali_1 extends StatefulWidget {
  String name;
  String gender;
  String dob;
  String birthTime;
  String birthPlace;
  final Map<String, dynamic> data;
  final Function(Map<String, dynamic> data) onReceivedData;
  kundali_1(
      {Key? key,
      required this.name,
      required this.gender,
      required this.dob,
      required this.birthTime,
      required this.birthPlace,
      required this.data,
      required this.onReceivedData})
      : super(key: key);

  @override
  State<kundali_1> createState() => _kundali_1State(
        name,
        gender,
        dob,
        birthTime,
        birthPlace,
      );
}

class _kundali_1State extends State<kundali_1> {
  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    data = widget.data;
    widget.onReceivedData(data);
  }

  String name;
  String gender;
  String dob;
  String birthTime;
  String birthPlace;
  _kundali_1State(
      this.name, this.gender, this.dob, this.birthTime, this.birthPlace);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
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
            bottom: TabBar(isScrollable: true, indicatorWeight: 2, tabs: [
              Tab(
                child: Text(
                  'Birth Details',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Horoscope Chart',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Planetary Details',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Dasha Report',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Dosha Report',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Daily Predictions',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Remedies',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              )
            ]),
          ),
          body: true
              ? TabBarView(children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: [
                          _basic_panchang_details(val1: 'Birth Details'),
                          SizedBox(
                            height: 30,
                          ),
                          _birth_details(val1: 'Name', val2: name),
                          _birth_details(val1: 'Gender', val2: gender),
                          _birth_details(val1: 'Day', val2: "${data['day']}"),
                          _birth_details(val1: 'Place', val2: birthPlace),
                          _birth_details(val1: 'Birth Date', val2: dob),
                          _birth_details(val1: 'Time', val2: birthTime),
                          _birth_details(
                              val1: 'Latitude', val2: "${data['latitude']}"),
                          _birth_details(
                              val1: 'Longitude', val2: "${data['longitude']}"),
                          _birth_details(
                              val1: 'Timezone', val2: "${data['timezone']}"),
                          _birth_details(
                              val1: 'Sunrise', val2: "${data['sunrise']}"),
                          _birth_details(
                              val1: 'Sunset', val2: "${data['sunset']}"),
                          _birth_details(
                              val1: 'Ayanamsha', val2: "${data['ayanamsha']}"),
                          SizedBox(
                            height: 50,
                          ),
                          _basic_panchang_details(
                              val1: 'Basic Panchang Details'),
                          SizedBox(
                            height: 30,
                          ),
                          _birth_details(val1: 'Tithi', val2: 'Krittika'),
                          _birth_details(val1: 'Nakshatra', val2: 'Krittika'),
                          _birth_details(val1: 'Yog', val2: 'Krittika'),
                          _birth_details(val1: 'Karan', val2: 'Krittika'),
                          SizedBox(
                            height: 50,
                          ),
                          _basic_panchang_details(val1: 'Avakhada Details'),
                          SizedBox(
                            height: 30,
                          ),
                          _birth_details(
                              val1: 'Verna', val2: 'Krishna Pratipada'),
                          _birth_details(
                              val1: 'Vanshya', val2: 'Krishna Pratipada'),
                          _birth_details(
                              val1: 'Yoni', val2: 'Krishna Pratipada'),
                          _birth_details(
                              val1: 'Gan', val2: 'Krishna Pratipada'),
                          _birth_details(
                              val1: 'Time Nadi', val2: 'Krishna Pratipada'),
                          _birth_details(
                              val1: 'Sign Lord', val2: 'Krishna Pratipada'),
                          _birth_details(
                              val1: 'Nakshatra', val2: 'Krishna Pratipada'),
                          _birth_details(
                              val1: 'Nakshatra Lord',
                              val2: 'Krishna Pratipada'),
                          _birth_details(
                              val1: 'Charan', val2: 'Krishna Pratipada'),
                          _birth_details(
                              val1: 'Yog', val2: 'Krishna Pratipada'),
                          _birth_details(
                              val1: 'Karan', val2: 'Krishna Pratipada'),
                          _birth_details(
                              val1: 'Tithi', val2: 'Krishna Pratipada'),
                          _birth_details(
                              val1: 'Name Alphabet', val2: 'Krishna Pratipada'),
                          _birth_details(
                              val1: 'Paya', val2: 'Krishna Pratipada'),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  )
                ])
              : Container()),
    );
  }

  _birth_details({required val1, required val2}) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10, left: 20),
        child: Table(
          children: [
            TableRow(children: [
              Text(
                val1,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                val2,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  fontSize: 14,
                ),
              ),
            ])
          ],
        ));
  }

  _basic_panchang_details({required val1}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
      child: Text(
        val1,
        style: GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.bodyMedium,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
