import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:it_book_store/features/book_search/display/pages/book_detail_page.dart';
import 'package:it_book_store/features/book_search/display/pages/search_page.dart';
import 'package:it_book_store/features/book_search/display/providers/book_detail_provider.dart';
import 'package:it_book_store/features/book_search/display/providers/book_search_provider.dart';
import 'package:provider/provider.dart';

import 'core/app_theme.dart';
import 'features/book_search/display/widgets/no_internet_widget.dart';

const bool debugMode = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => BookSearchProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => BookDetailProvider()),
      ],
      child: MaterialApp(
        title: 'IT Book',
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          fontFamily: 'GothamRounded',
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.black,
          primaryColorLight: AppTheme.primaryColor,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Colors.white,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'GothamRounded',
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        builder: (context, child) => NoInternetWrapper(
          child: BotToastInit()(context, child),
        ),
        home: SearchPage(),
        routes: {
          'book_detail_page': (context) => BookDetailPage()
        },
      ),
    );
  }

}
