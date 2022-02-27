import 'package:flutter/material.dart';
import 'package:cuaca/services/location.dart';
import 'package:cuaca/services/networking.dart';

const apiKey = '338d1c421f067273216cbe802d0fad65';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkHelper.getData();


  }

  void getData() async {


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
