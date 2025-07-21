import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(super.initialTheme);


  Future<void> setLightTheme() async{
    emit(ThemeMode.light);
  }

  Future<void> setDarkTheme() async{
    emit(ThemeMode.dark);
  }

}