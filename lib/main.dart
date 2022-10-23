import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:it_book_store/it_book_app.dart';

const bool debugMode = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]);

  runApp(const ItBookApp());
}

