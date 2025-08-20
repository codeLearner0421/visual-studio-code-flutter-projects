import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty
        ? ModalRoute.of(context)!.settings.arguments as Map
        : data;

    String backgroundImage;
    Color backgroundColor;
    Color textColor;

    if (data['isDaytime']) {
      backgroundImage = 'day.jpg';
      backgroundColor = Colors.yellow[50]!;
      textColor = Colors.black;
    } else {
      backgroundImage = 'night.jpg';
      backgroundColor = Colors.black;
      textColor = Colors.white;
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$backgroundImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(
                      context,
                      '/chooseLocationScreen',
                    );
                    setState(() {
                      data = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDaytime': result['isDaytime'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: textColor,
                    size: 30.0,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(fontSize: 20.0, color: textColor),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 66.0, color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
