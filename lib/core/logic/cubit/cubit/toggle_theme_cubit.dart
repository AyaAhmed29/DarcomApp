import 'package:bloc/bloc.dart';
import 'package:darcom_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';


class ToggleThemeCubit extends Cubit<ThemeData> {
  ToggleThemeCubit() : super(AppTheme.lightTheme);

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? AppTheme.lightTheme : AppTheme.darkTheme);
  } 
}
