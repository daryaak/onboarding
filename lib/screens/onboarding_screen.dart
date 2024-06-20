import 'package:flutter/material.dart';
import 'package:onboarding/gen/fonts.gen.dart';
import 'package:onboarding/widgets/buttom_part.dart';

class OnboardingScreen extends StatelessWidget{

  final Color color;
  final String topText;
  final String buttomText;
  final String image;
  final int index;
  final Function()? onNextTapped;
  final Function()? onSkipTapped;
  final PageController controller;

  OnboardingScreen(this.color,this.topText,
                  this.buttomText,this.image,
                  this.index,this.onNextTapped,
                  this.onSkipTapped, this.controller);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: color,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.064,
              right: MediaQuery.of(context).size.width * 0.064,
              top: MediaQuery.of(context).size.height * 0.10,
              bottom: MediaQuery.of(context).size.height * 0.014,
            ),
            child: Text(
              topText,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontFamily: FontFamily.sFProText,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.064,
              right: MediaQuery.of(context).size.width * 0.064,
            ),
            child: Text(
              buttomText,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontFamily: FontFamily.sFProText,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.04
            ),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
            Expanded(
              child: ButtomPart(
                controller: controller,
                page: index,
                onSkipTapped: onSkipTapped,
                onNextTapped: onNextTapped,
                backgroundColor: color,
              ),
            ),
        ],
      ),
    );
  }
}