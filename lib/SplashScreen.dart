import 'dart:async';
//import 'package:assingment_zarvis/LoginPage.dart';
import 'package:assingment_zarvis/SignupPage.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignupPage()),
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(seconds: 2),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset('assets/images/img.png'), // Replace 'your_gif_file.gif' with your actual GIF file path
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}