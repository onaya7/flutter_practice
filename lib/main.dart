import 'package:flutter/material.dart';
import 'package:flutter_practice/page/about_page.dart';
import 'package:flutter_practice/page/home_page.dart';
import 'package:flutter_practice/page/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Manage(),)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Homepage(),
          '/about': (context) => const AboutPage()
        },
        theme: ThemeData(
          primaryColorLight: Colors.white,
          primaryColorDark: Colors.black,
          useMaterial3: true,
        ),
      ),
    );
  }
}
