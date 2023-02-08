import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/pages/home_screen.dart';
void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    //flutter k andr wudgets use ki jaati hain
    //e.g text , icons , status bar , app bar, body ,heiarchy widgets hoti h

    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
     //initial route mein back slash/ replace hojata hai
      routes: {
        "/": (context) => const HomeScreen(),
       // "/home": (context) => HomePage(),
       // "/Login": (context) => LoginPage(),
      },
    );
  }
}