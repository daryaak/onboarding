import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenCubit extends Cubit<int> {
  ScreenCubit() : super(0);

  void nextPage() {
   if(state!=4) emit(state + 1);
  }

  void skip(){
    emit(4);
  }
}