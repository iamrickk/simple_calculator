import 'dart:async';

import 'package:calculator_pr/colors/color.dart';
import 'package:calculator_pr/pages/home_page.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => home_page(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: splash_screen_color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'Calcu',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: AutofillHints.countryCode,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 5.0,
                          color: Colors.white)),
                  TextSpan(
                      text: 'Lator',
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: AutofillHints.countryCode,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 5.0,
                          color: Colors.redAccent)),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
