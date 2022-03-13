import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF00FFFF);

  static const primaryGradient = LinearGradient(
    colors: [Colors.blue, Colors.white10],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.transparent, Colors.black12, Colors.black38],
    ),
  );
}

class AppWidgets {
  static const circularProgressIndicator = Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(AppTheme.primaryColor),
      strokeWidth: 3,
    ),
  );

  static const loader = Center(
    child: SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(AppTheme.primaryColor),
        strokeWidth: 3,
      ),
    ),
  );

  static const smallLoader = Padding(
    padding: EdgeInsets.all(4),
    child: SizedBox(
      width: 15,
      height: 15,
      child: circularProgressIndicator,
    ),
  );

  static const error = Icon(
    Icons.error_outline,
    size: 50,
    color: Colors.redAccent,
  );
}
