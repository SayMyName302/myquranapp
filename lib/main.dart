import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/pages/home_screen.dart';
import 'package:quranapp/pages/videoplayer.dart';
import 'package:quranapp/custom_widgets/qibla_direction.dart';

void main() {
  runApp(QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    //flutter k andr wudgets use ki jaati hain
    //e.g text , icons , status bar , app bar, body ,heiarchy widgets hoti h

    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),

      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      //initial route mein back slash/ replace hojata hai
      routes: {
        "/": (context) => QiblaCompass(),
        // "/home": (context) => HomePage(),
        // "/Login": (context) => LoginPage(),
      },
    );
  }
}
