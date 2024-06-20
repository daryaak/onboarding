import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/cubit/screen_cubit.dart';
import 'package:onboarding/screens/main_page.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> ScreenCubit(),
      child: MaterialApp(
        home: MainPage()
      ),
    );
  }
}
