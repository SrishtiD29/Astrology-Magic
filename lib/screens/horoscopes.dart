// ignore_for_file: camel_case_types, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:astro_world/screens/daily-horoscope.dart';
import 'package:astro_world/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class horoscopes extends StatefulWidget {
  const horoscopes({Key? key}) : super(key: key);

  @override
  State<horoscopes> createState() => _horoscopesState();
}

class _horoscopesState extends State<horoscopes> {
//    ====================== ARIES =======================
  Map<String, dynamic> data = {};
  Future<void> fetchAries() async {
    try {
      final http.Response response = await http.post(
        Uri.parse(
            'https://apis.sanatanjyoti.com/api/sun_sign_prediction/daily/Aries/en'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          data = Map<String, dynamic>.from(jsonDecode(response.body));
        });

        final bool success = data.isNotEmpty;
        if (success) {
          print('Aries Successful');
        } else {
          print('Aries Not Successful');
        }
      } else {
        print('Check again');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  //    ====================== TAURUS =======================
  Map<String, dynamic> taurusData = {};
  Future<void> fetchTaurus() async {
    try {
      final http.Response response = await http.post(
        Uri.parse(
            'https://apis.sanatanjyoti.com/api/sun_sign_prediction/daily/Taurus/en'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          taurusData = Map<String, dynamic>.from(jsonDecode(response.body));
        });

        final bool success = taurusData.isNotEmpty;
        if (success) {
          print('Taurus Successful');
        } else {
          print('Taurus Not Successful');
        }
      } else {
        print('Check again');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  //    ====================== GEMINI =======================
  Map<String, dynamic> geminiData = {};
  Future<void> fetchGemini() async {
    try {
      final http.Response response = await http.post(
          Uri.parse(
              'https://apis.sanatanjyoti.com/api/sun_sign_prediction/daily/Gemini/en'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          });
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          geminiData = Map<String, dynamic>.from(jsonDecode(response.body));
        });
        final bool success = geminiData.isNotEmpty;
        if (success) {
          print('Gemini Successful');
        } else {
          print('Gemini Not Successful');
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }

//    ====================== CANCER =======================
  Map<String, dynamic> cancerData = {};
  Future<void> fetchCancer() async {
    try {
      final http.Response response = await http.post(
          Uri.parse(
              'https://apis.sanatanjyoti.com/api/sun_sign_prediction/daily/Cancer/en'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          });
      print('Response Status Code : ${response.statusCode}');
      print('Response Body : ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          cancerData = Map<String, dynamic>.from(jsonDecode(response.body));
        });
        final bool success = cancerData.isNotEmpty;
        if (success) {
          print('Cancer Successful');
        } else {
          print('Cancer Not Successful');
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  //    ====================== LEO =======================
  Map<String, dynamic> leoData = {};
  Future<void> fetchLeo() async {
    try {
      final http.Response response = await http.post(
          Uri.parse(
              'https://apis.sanatanjyoti.com/api/sun_sign_prediction/daily/Leo/en'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          });
      print('Response Status Code : ${response.statusCode}');
      print('Response Body : ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          leoData = Map<String, dynamic>.from(jsonDecode(response.body));
        });
        final bool success = leoData.isNotEmpty;
        if (success) {
          print('Leo Successful');
        } else {
          print('Leo Not Successful');
        }
      }
    } catch (e) {
      print('Error $e');
    }
  }

//    ====================== VIRGO =======================
  Map<String, dynamic> virgoData = {};
  Future<void> fetchVirgo() async {
    try {
      final http.Response response = await http.post(
          Uri.parse(
              'https://apis.sanatanjyoti.com/api/sun_sign_prediction/daily/Virgo/en'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          });
      print('Response Status Code : ${response.statusCode}');
      print('Response Body : ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          virgoData = Map<String, dynamic>.from(jsonDecode(response.body));
        });
        final bool success = virgoData.isNotEmpty;
        if (success) {
          print('Virgo Successful');
        } else {
          print('Virgo Not Successful');
        }
      }
    } catch (e) {
      print('Error : $e');
    }
  }

//    ====================== LIBRA =======================
  Map<String, dynamic> libraData = {};
  Future<void> fetchLibra() async {
    try {
      final http.Response response = await http.post(
          Uri.parse(
              'https://apis.sanatanjyoti.com/api/sun_sign_prediction/daily/Libra/en'),
          headers: <String, String>{'Content-Type': 'application/json'});
      print('Response Status Code : ${response.statusCode}');
      print('Response Body : ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          libraData = Map<String, dynamic>.from(jsonDecode(response.body));
        });
        final bool success = libraData.isNotEmpty;
        if (success) {
          print('Libra Successful');
        } else {
          print('Libra Not Successful');
        }
      }
    } catch (e) {
      print('Error : $e');
    }
  }

  //    ====================== SCORPIO =======================
  Map<String, dynamic> scorpioData = {};
  Future<void> fetchScorpio() async {
    try {
      final http.Response response = await http.post(
          Uri.parse(
              'https://apis.sanatanjyoti.com/api/sun_sign_prediction/daily/Scorpio/en'),
          headers: <String, String>{'Content-Type': 'application/json'});
      print('Response Status Code : ${response.statusCode}');
      print('Response Body : ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          scorpioData = Map<String, dynamic>.from(jsonDecode(response.body));
        });
        final bool success = scorpioData.isNotEmpty;
        if (success) {
          print('Libra Successful');
        } else {
          print('Libra Not Successful');
        }
      }
    } catch (e) {
      print('Error : $e');
    }
  }

  //    ====================== SAGITTARIUS =======================
  Map<String, dynamic> sagittariusData = {};
  Future<void> fetchSagittarius() async {
    try {
      final http.Response response = await http.post(
          Uri.parse(
              'https://apis.sanatanjyoti.com/api/sun_sign_prediction/daily/Sagittarius/en'),
          headers: <String, String>{'Content-Type': 'application/json'});
      print('Response Status Code : ${response.statusCode}');
      print('Response Body : ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          sagittariusData =
              Map<String, dynamic>.from(jsonDecode(response.body));
        });
        final bool success = sagittariusData.isNotEmpty;
        if (success) {
          print('Libra Successful');
        } else {
          print('Libra Not Successful');
        }
      }
    } catch (e) {
      print('Error : $e');
    }
  }

  //    ====================== CAPRICORN =======================
  Map<String, dynamic> capricornData = {};
  Future<void> fetchCapricorn() async {
    try {
      final http.Response response = await http.post(
          Uri.parse(
              'https://apis.sanatanjyoti.com/api/sun_sign_prediction/daily/Capricorn/en'),
          headers: <String, String>{'Content-Type': 'application/json'});
      print('Response Status Code : ${response.statusCode}');
      print('Response Body : ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          capricornData = Map<String, dynamic>.from(jsonDecode(response.body));
        });
        final bool success = capricornData.isNotEmpty;
        if (success) {
          print('Capricorn Successful');
        } else {
          print('Cpricorn Not Successful');
        }
      }
    } catch (e) {
      print('Error $e');
    }
  }

  //    ====================== AQUARIUS =======================
  Map<String, dynamic> aquariusData = {};
  Future<void> fetchAquarius() async {
    try {
      final http.Response response = await http.post(
          Uri.parse(
              'https://apis.sanatanjyoti.com/api/sun_sign_prediction/daily/Aquarius/en'),
          headers: <String, String>{'Content-Type': 'application/json'});
      print('Response Status Code : ${response.statusCode}');
      print('Response Body : ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          aquariusData = Map<String, dynamic>.from(jsonDecode(response.body));
        });
        final bool success = aquariusData.isNotEmpty;
        if (success) {
          print('Capricorn Successful');
        } else {
          print('Cpricorn Not Successful');
        }
      }
    } catch (e) {
      print('Error $e');
    }
  }

  //    ====================== PISCES =======================
  Map<String, dynamic> piscesData = {};
  Future<void> fetchPisces() async {
    try {
      final http.Response response = await http.post(
          Uri.parse(
              'https://apis.sanatanjyoti.com/api/sun_sign_prediction/daily/Pisces/en'),
          headers: <String, String>{'Content-Type': 'application/json'});
      print('Response Status Code : ${response.statusCode}');
      print('Response Body : ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          piscesData = Map<String, dynamic>.from(jsonDecode(response.body));
        });
        final bool success = piscesData.isNotEmpty;
        if (success) {
          print('Capricorn Successful');
        } else {
          print('Cpricorn Not Successful');
        }
      }
    } catch (e) {
      print('Error $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAries();
    fetchTaurus();
    fetchGemini();
    fetchCancer();
    fetchLeo();
    fetchVirgo();
    fetchLibra();
    fetchScorpio();
    fetchSagittarius();
    fetchCapricorn();
    fetchAquarius();
    fetchPisces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const home_screen()));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(),
                            child: const Icon(
                              Icons.arrow_back,
                              size: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            'Choose Your Horoscope',
                            style: GoogleFonts.poppins(
                                textStyle:
                                    Theme.of(context).textTheme.bodyLarge,
                                fontSize: 23,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => daily_horoscope(
                              data: data,
                              onDataReceived: (Map<String, dynamic> data) {},
                            ),
                          ));
                    },
                    child: Image.network(
                      "https://img.freepik.com/premium-vector/zodiac-sign-aries-isolated-vector-icon-zodiac-symbol-with-starry-gradient-design_502651-112.jpg?w=740",
                      height: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => daily_horoscope(
                              data: taurusData,
                              onDataReceived:
                                  (Map<String, dynamic> taurusData) {},
                            ),
                          ));
                    },
                    child: Image.network(
                      "https://img.freepik.com/premium-vector/zodiac-sign-taurus-isolated-vector-icon-zodiac-symbol-with-starry-gradient-design_502651-114.jpg?w=740",
                      height: 100,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => daily_horoscope(
                            data: geminiData,
                            onDataReceived:
                                (Map<String, dynamic> geminiData) {},
                          ),
                        ));
                  },
                  child: Image.network(
                    "https://img.freepik.com/premium-vector/zodiac-sign-gemini-isolated-vector-icon-zodiac-symbol-with-starry-gradient-design_502651-116.jpg?w=740",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => daily_horoscope(
                                onDataReceived:
                                    (Map<String, dynamic> cancerData) {},
                                data: cancerData)));
                  },
                  child: Image.network(
                    "https://img.freepik.com/premium-vector/zodiac-sign-cancer-isolated-vector-icon-zodiac-symbol-with-starry-gradient-design_502651-118.jpg?w=740",
                    height: 100,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => daily_horoscope(
                                onDataReceived:
                                    (Map<String, dynamic> leoData) {},
                                data: leoData)));
                  },
                  child: Image.network(
                    "https://img.freepik.com/premium-vector/zodiac-sign-leo-isolated-vector-icon-zodiac-symbol-with-starry-gradient-design_502651-120.jpg",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => daily_horoscope(
                                onDataReceived:
                                    (Map<String, dynamic> virgoData) {},
                                data: virgoData)));
                  },
                  child: Image.network(
                    "https://img.freepik.com/premium-vector/zodiac-sign-virgo-isolated-vector-icon-zodiac-symbol-with-starry-gradient-design_502651-121.jpg",
                    height: 100,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => daily_horoscope(
                                onDataReceived:
                                    (Map<String, dynamic> libraData) {},
                                data: libraData)));
                  },
                  child: Image.network(
                    "https://img.freepik.com/premium-vector/zodiac-sign-libra-isolated-vector-icon-zodiac-symbol-with-starry-gradient-design_502651-122.jpg",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => daily_horoscope(
                                onDataReceived:
                                    (Map<String, dynamic> scorpioData) {},
                                data: scorpioData)));
                  },
                  child: Image.network(
                    "https://img.freepik.com/premium-vector/zodiac-sign-scorpio-isolated-vector-icon-zodiac-symbol-with-starry-gradient-design_502651-123.jpg",
                    height: 100,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => daily_horoscope(
                                onDataReceived:
                                    (Map<String, dynamic> sagittariusData) {},
                                data: sagittariusData)));
                  },
                  child: Image.network(
                    "https://img.freepik.com/premium-vector/zodiac-sign-sagittarius-isolated-vector-icon-zodiac-symbol-with-starry-gradient-design_502651-124.jpg",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => daily_horoscope(
                                onDataReceived:
                                    (Map<String, dynamic> capricornData) {},
                                data: capricornData)));
                  },
                  child: Image.network(
                    "https://img.freepik.com/premium-vector/zodiac-sign-capricorn-isolated-vector-icon-zodiac-symbol-with-starry-gradient-design_502651-125.jpg",
                    height: 100,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => daily_horoscope(
                                  onDataReceived:
                                      (Map<String, dynamic> aquariusData) {},
                                  data: aquariusData)));
                    },
                    child: Image.network(
                      "https://img.freepik.com/premium-vector/zodiac-sign-aquarius-isolated-vector-icon-zodiac-symbol-with-starry-gradient-design_502651-126.jpg",
                      height: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => daily_horoscope(
                                  onDataReceived:
                                      (Map<String, dynamic> piscesData) {},
                                  data: piscesData)));
                    },
                    child: Image.network(
                      "https://img.freepik.com/premium-vector/zodiac-sign-pisces-isolated-vector-icon-zodiac-symbol-with-starry-gradient-design_502651-127.jpg",
                      height: 100,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
