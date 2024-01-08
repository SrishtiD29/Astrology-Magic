// ignore_for_file: camel_case_types, file_names

import 'dart:async';

import 'package:astro_world/screens/home.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const home_screen()),
      );
    });
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Image.network(
          'https://i.etsystatic.com/7222101/r/il/0c84b6/2557820684/il_570xN.2557820684_m2ht.jpg',
        ),
      ),
    );
  }
}
