import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cuaca/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=338d1c421f067273216cbe802d0fad65'));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      double temparature = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];
      print(temparature);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
