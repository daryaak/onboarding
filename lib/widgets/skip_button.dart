import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget{

  final Function()? buttonTapped;

  SkipButton({required this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: buttonTapped,
            child: Container(
              padding: const EdgeInsets.all(0.0),
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
          );
  }
}