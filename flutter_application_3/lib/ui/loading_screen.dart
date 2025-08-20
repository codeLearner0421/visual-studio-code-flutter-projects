import 'package:flutter/material.dart';
import 'package:flutter_application_3/object/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitSquareCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }

  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(
      location: 'Berlin',
      flag: 'germany.png',
      url: 'zone?timeZone=Europe%2FBerlin',
    );

    await worldTime.getTime();

    Navigator.pushReplacementNamed(
      context,
      '/homeScreen',
      arguments: {
        'location': worldTime.location,
        'flag': worldTime.flag,
        'time': worldTime.time,
        'isDaytime' : worldTime.isDaytime
      },
    );
  }
}
