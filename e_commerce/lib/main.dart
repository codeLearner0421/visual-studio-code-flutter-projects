import 'package:e_commerce/colors/colors.dart';
import 'package:e_commerce/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryLight),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        fontFamily: "OpenSans",
      ),
    );
  }
}
