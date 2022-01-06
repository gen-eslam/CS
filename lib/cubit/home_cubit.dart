import 'package:bloc/bloc.dart';
import 'package:cs/cubit/state.dart';
import 'package:cs/module/courses_screen.dart';
import 'package:cs/module/hardware_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<app> {
  HomeCubit() : super(InitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex =0;
  List<String> appBarTitle =[
    'cs student Courses',
    'cs student Hardware',
  ];
  List<BottomNavigationBarItem> bottomNavBar =
  [
    BottomNavigationBarItem(icon: Icon(Icons.menu_book),label: 'Courses'),
    BottomNavigationBarItem(icon: Icon(Icons.hardware),label: 'Hardware'),
  ];
  List <Widget> screens=
  [
    CoursesScreen(),
    HardwareScreen(),
  ];
  void onTapNavBar(int index)
  {
    currentIndex= index;
    emit(ChangeBottomNavBarItem());
  }
}
