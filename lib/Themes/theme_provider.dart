import 'package:flutter/material.dart';
import 'package:peepster/Themes/dark.dart';
import 'package:peepster/Themes/light.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData=lightMode;
  ThemeData get themeData =>_themeData;
  bool get isDarkMode => _themeData ==darkMode;
  set themeData (ThemeData themedata){
   _themeData=themedata;
   notifyListeners();
  }

  void toggleTheme(){
    if(_themeData==lightMode){
      _themeData=darkMode;
    }else{
      _themeData=lightMode;
    }
    notifyListeners();
  }

}