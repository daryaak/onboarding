import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/cubit/screen_cubit.dart';
import 'package:onboarding/gen/assets.gen.dart';
import 'package:onboarding/screens/last_screen.dart';
import 'package:onboarding/screens/onboarding_screen.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ScreenCubit, int>(
      listener: (context, state) {
        _pageController.animateToPage(
            state,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: BlocBuilder<ScreenCubit, int>(
          builder: (context, state) {
          return Scaffold(
              body: Column(
                children: [
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      children: [
                        OnboardingScreen(
                          const Color.fromARGB(255, 240, 207, 105), 
                          'Your first car without\na drivers license', 
                          'Goes to meet people who just\ngot their license', 
                          Assets.images.imgCar1.path,
                          state,
                          () => context.read<ScreenCubit>().nextPage(),
                          () => context.read<ScreenCubit>().skip(),
                          _pageController
                          ),
                        OnboardingScreen(
                          const Color.fromARGB(255, 183, 171, 253), 
                          'Always there: more than\n1000 cars in Tbilisi', 
                          'Our company is a leader by the\nnumber of cars in the fleet', 
                          Assets.images.imgCar2.path,
                          state,
                          () => context.read<ScreenCubit>().nextPage(),
                          () => context.read<ScreenCubit>().skip(),
                          _pageController
                        ),
                        OnboardingScreen(
                        const Color.fromARGB(255, 239, 180, 145), 
                        'Do not pay for parking,\nmaintenance and gasoline', 
                        'We will pay for you, all expenses\nrelated to the car', 
                        Assets.images.imgCar3.path,
                        state,
                          () => context.read<ScreenCubit>().nextPage(),
                          () => context.read<ScreenCubit>().skip(),
                          _pageController
                        ),
                        OnboardingScreen(
                        const Color.fromARGB(255, 149, 182, 255),
                        '29 car models: from Skoda\nOctavia to Porsche 911', 
                        'Choose between regular car models\nor exclusive ones', 
                        Assets.images.imgCar4.path,
                        state,
                          () => context.read<ScreenCubit>().nextPage(),
                          () => context.read<ScreenCubit>().skip(),
                          _pageController
                        ),
                        LastScreen()
                      ],
                    ),
                  ),
                ],
              )
            );
      }
      )
    ));
  }
}