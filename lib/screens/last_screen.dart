import 'package:flutter/material.dart';
import 'package:onboarding/gen/fonts.gen.dart';

class LastScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return const Scaffold(
        backgroundColor: Color.fromARGB(255, 149, 182, 255),
        body: Center(
          child: Text(
            'You are a clever person!',
            style: TextStyle(
              fontSize: 24,
              fontFamily: FontFamily.sFProText,
              fontWeight: FontWeight.w700,
              color: Colors.white
            ),
          ),
        ),
      );
  }

  
}