import 'package:flutter/material.dart';
import 'package:flutter_application_3/object/world_time.dart';

class ChooseLocationScreen extends StatefulWidget {
  const ChooseLocationScreen({super.key});

  @override
  State<ChooseLocationScreen> createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {
  List<WorldTime> locations = [
    WorldTime(
      location: 'London',
      flag: 'uk.png',
      url: 'zone?timeZone=Europe%2FLondon',
    ),
    WorldTime(
      location: 'Athens',
      flag: 'greece.png',
      url: 'zone?timeZone=Europe%2FBerlin',
    ),
    WorldTime(
      location: 'Cairo',
      flag: 'egypt.png',
      url: 'zone?timeZone=Africa%2FCairo',
    ),
    WorldTime(
      location: 'Nairobi',
      flag: 'kenya.png',
      url: 'zone?timeZone=Africa%2FNairobi',
    ),
    WorldTime(
      location: 'Chicago',
      flag: 'usa.png',
      url: 'zone?timeZone=America%2FChicago',
    ),
    WorldTime(
      location: 'New York',
      flag: 'usa.png',
      url: 'zone?timeZone=America%2FNew_York',
    ),
    WorldTime(
      location: 'Seoul',
      flag: 'south_korea.png',
      url: 'zone?timeZone=Asia%2FSeoul',
    ),
    WorldTime(
      location: 'Jakarta',
      flag: 'indonesia.png',
      url: 'zone?timeZone=Asia%2FJakarta',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/${locations[index].flag}',
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: locations.length,
      ),
    );
  }

  void updateTime(index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();

    // Navigate to home screen.

    Navigator.pop(context, {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDaytime': worldTime.isDaytime,
    });
  }
}
