// ignore_for_file: camel_case_types, non_constant_identifier_names, unused_import

import 'dart:convert';

import 'package:astro_world/screens/daily-horoscope.dart';
import 'package:astro_world/screens/horoscopes.dart';
import 'package:astro_world/screens/panchang-screen.dart';
import 'package:astro_world/screens/settings.dart';
import 'package:astro_world/services/panchang-api.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CarouselController _controller = CarouselController();

  Map<String, dynamic>? dataMap;
  List<dynamic>? data;

  Future<void> fetchData() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://apis.sanatanjyoti.com/article/get_blogs?category=All&categoryName=&keyword=&articleType=PUBLISH&isDraftBlog=false&festivalStatus=true&status=true&page=0&size=5'));

    if (response.statusCode == 200) {
      setState(() {
        dataMap = jsonDecode(response.body);
        data = dataMap!["data"];

        if (data != null) {
          imageUrls = data!
              .where((item) =>
                  item is Map<String, dynamic> && item.containsKey('imageUrl'))
              .map<String>((item) => item['imageUrl'].toString())
              .toList();
        }

        if (data != null) {
          crData = data!
              .where((item) =>
                  item is Map<String, dynamic> && item.containsKey('title'))
              .map<String>((item) => item['title'].toString())
              .toList();
        }
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  String removeHtmlTags(String text) {
    // Define a regular expression to match the tags and line breaks
    final RegExp exp = RegExp(r"<[^>]*>|\\r|\\n|&nbsp");

    // Replace the matched patterns with an empty string
    return text.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Astrology Magic',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.wallet,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const settings()));
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ))
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Colors.white),
        ),
        elevation: 50.0,
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
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
                title: Text(
                  "Name",
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  "Phone Number",
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    _scaffoldKey.currentState?.closeDrawer();
                  },
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                size: 20,
              ),
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 13),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const home_screen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.temple_hindu,
                size: 20,
              ),
              title: const Text(
                'Book a Pooja',
                style: TextStyle(fontSize: 13),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.chat,
                size: 20,
              ),
              title: const Text(
                'Chat with Astrologer',
                style: TextStyle(fontSize: 13),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.touch_app,
                size: 20,
              ),
              title: const Text(
                'Sign up as Astrologer',
                style: TextStyle(fontSize: 13),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                size: 20,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(fontSize: 13),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const settings()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.phone_android,
                size: 20,
              ),
              title: const Text(
                'Contact Us',
                style: TextStyle(fontSize: 13),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.call,
                size: 20,
              ),
              title: const Text(
                'Call Us',
                style: TextStyle(fontSize: 13),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(255, 236, 236, 236),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(bottom: 8, top: 8),
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Card(
                    elevation: 0.5,
                    color: const Color.fromARGB(255, 255, 254, 254),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: const TextStyle(fontSize: 15),
                        contentPadding: const EdgeInsets.only(top: 5),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => _searchController.clear(),
                        ),
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  height: 180.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                items: imageUrls.asMap().entries.map((entry) {
                  int index = entry.key;
                  String imageUrl = entry.value;
                  String currentCrData =
                      index < crData.length ? crData[index] : '';

                  return Builder(builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              imageUrl,
                            ),
                            fit: BoxFit.fill,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 20,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.only(left: 20),
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
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Text(
                              currentCrData,
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
                }).toList(),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 450,
                color: Colors.white,
                margin: const EdgeInsets.only(top: 25),
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const horoscopes()));
                          },
                          child: Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Color(0xFFFFCB43),
                                      Color(0xFFFF6425),
                                      Color(0xFFFF0016),
                                    ],
                                    stops: [0.0, 0.37, 1.0],
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                  'assets/icons/horoscope-icon.png')),
                        ),
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Color(0xFFFFCB43),
                                  Color(0xFFFF6425),
                                  Color(0xFFFF0016),
                                ],
                                stops: [0.0, 0.37, 1.0],
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset('assets/icons/kundali-icon.png'),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Daily\nHoroscope',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 1.2),
                        ),
                        Text(
                          ' Free\n  Kundali',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 1.2),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Color(0xFFFFCB43),
                                    Color(0xFFFF6425),
                                    Color(0xFFFF0016),
                                  ],
                                  stops: [0.0, 0.37, 1.0],
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                                'assets/icons/kundali-matching-icon.png')),
                        GestureDetector(
                          onTap: () {
                            // fetchData();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const panchang_screen()));
                          },
                          child: Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Color(0xFFFFCB43),
                                      Color(0xFFFF6425),
                                      Color(0xFFFF0016),
                                    ],
                                    stops: [0.0, 0.37, 1.0],
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                  'assets/icons/panchang-icon.png')),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Kundali \nMatching',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 1.2),
                        ),
                        Text(
                          '  Panchang',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 1.2),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                  top: 25,
                ),
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: []),
                child: Column(
                  children: [
                    _astro_container(
                        title: data != null && data!.isNotEmpty
                            ? removeHtmlTags(data?[0]['title'])
                            : 'Loading...',
                        img: data?[0]['imageUrl'],
                        para: data != null && data!.isNotEmpty
                            ? removeHtmlTags(data?[0]['subject'])
                            : 'Loading...'),
                    _astro_container(
                        title: data != null && data!.isNotEmpty
                            ? removeHtmlTags(data?[1]['title'])
                            : 'Loading...',
                        img: data?[1]['imageUrl'],
                        para: data != null && data!.isNotEmpty
                            ? removeHtmlTags(data?[1]['subject'])
                            : 'Loading...'),
                    _astro_container(
                        title: data != null && data!.isNotEmpty
                            ? removeHtmlTags(data?[2]['title'])
                            : 'Loading...',
                        img: data?[2]['imageUrl'],
                        para: data != null && data!.isNotEmpty
                            ? removeHtmlTags(data?[2]['subject'])
                            : 'Loading...'),
                    _astro_container(
                        title: data != null && data!.isNotEmpty
                            ? removeHtmlTags(data?[3]['title'])
                            : 'Loading...',
                        img: data?[3]['imageUrl'],
                        para: data != null && data!.isNotEmpty
                            ? removeHtmlTags(data?[3]['subject'])
                            : 'Loading...'),
                    _astro_container(
                        title: data != null && data!.isNotEmpty
                            ? removeHtmlTags(data?[4]['title'])
                            : 'Loading...',
                        img: data?[4]['imageUrl'],
                        para: data != null && data!.isNotEmpty
                            ? removeHtmlTags(data?[4]['subject'])
                            : 'Loading...'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _astro_container({required title, required para, required img}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
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
              width: 2.5),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 5),
                child: Text(title != null ? title.toString() : 'N/A',
                    style: GoogleFonts.poppins(
                        fontSize: 22, fontWeight: FontWeight.w500)),
              ),
              Image.network(
                img != null ? img.toString() : 'N/A',
                fit: BoxFit.fill,
                width: 500,
                height: MediaQuery.of(context).size.height - 550,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  para != null ? para.toString() : 'N/A',
                  style: GoogleFonts.poppins(
                      fontSize: 13, fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<String> imageUrls = [];
  List<String> crData = [];
}
