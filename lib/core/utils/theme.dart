import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryGradient = LinearGradient(
  colors: [Color(0xffd2d2d2), Color(0xfff5f5f5)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.0, 0.4],
  tileMode: TileMode.clamp,
);

final List<ThemeData> themes = [
  ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    primaryColor: const Color(0xFFFFFFFF),
    errorColor: Colors.redAccent,
    indicatorColor: Colors.black,
    highlightColor: Colors.grey,
    textTheme: TextTheme(
      bodyText1: GoogleFonts.ubuntu(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodyText2: GoogleFonts.ubuntu(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      headline1: GoogleFonts.ubuntu(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      headline2: GoogleFonts.ubuntu(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    ),
  ),
];