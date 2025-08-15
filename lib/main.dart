import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      title : 'EduVerse',
      home : SplashScreen(),
      debugShowCheckedModeBanner : false,
      themeMode : ThemeMode.system,
    );
  }
}