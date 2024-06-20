import 'package:flutter/material.dart';
import 'package:onboarding/widgets/next_button.dart';
import 'package:onboarding/widgets/skip_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ButtomPart extends StatelessWidget {

  final int page;
  final Function()? onNextTapped;
  final Function()? onSkipTapped;
  final PageController controller;
  final Color backgroundColor;

  const ButtomPart({
    super.key,
    required this.page,
    required this.onNextTapped,
    required this.onSkipTapped, 
    required this.controller,
    required this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: 4,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: Colors.white,
                      dotColor: Colors.white54,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SkipButton(buttonTapped: onSkipTapped),
                ],
              ),
              const Spacer(),
              NextButton(
                index: page,
                onButtonTapped: onNextTapped,
                color: backgroundColor,
              ),
            ],
          ),
      
      ),
    );
  }
}