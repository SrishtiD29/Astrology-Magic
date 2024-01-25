// ignore_for_file: unused_import

import 'package:astro_world/screens/edit-pofile-screen.dart';
import 'package:astro_world/screens/home.dart';
import 'package:astro_world/screens/kundali.dart';
import 'package:astro_world/screens/kundali_1.dart';
import 'package:astro_world/screens/login-screen.dart';
import 'package:astro_world/screens/panchang-screen.dart';
import 'package:astro_world/screens/settings.dart';
import 'package:astro_world/screens/sign-up-screen.dart';
import 'package:astro_world/screens/splash-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.oswald(textStyle: textTheme.bodyMedium),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: home_screen(),
    );
  }
}
