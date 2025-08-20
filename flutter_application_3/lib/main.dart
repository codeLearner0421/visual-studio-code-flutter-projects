import 'package:flutter/material.dart';
import 'package:flutter_application_3/ui/choose_location_screen.dart';
import 'package:flutter_application_3/ui/home_screen.dart';
import 'package:flutter_application_3/ui/loading_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
        ),
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/homeScreen': (context) => const HomeScreen(),
        '/chooseLocationScreen': (context) => const ChooseLocationScreen(),
      },
    ),
  );
}
