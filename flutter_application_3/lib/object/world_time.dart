import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String flag;
  String url;
  late String time;
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // Make sure main can use async/await
      Response response = await get(
        Uri.parse(
          'https://www.timeapi.io/api/time/current/$url',
        ),
      );

      Map data = jsonDecode(response.body);

      // Get properties from data
      String dateTime = data['dateTime'];
      DateTime now = DateTime.parse(dateTime);
 
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

      // Format the time using intl
      time = DateFormat.jm().format(now);

    } catch (error) {
      print('Caught Error: $error');
      time = 'Failed to get time data.';
    }
  }
}
