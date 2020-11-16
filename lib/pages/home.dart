import 'package:flutter/material.dart';
import 'package:flutter_time_app/services/world_time.dart'; 

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String time = 'Loading ...';
  int hours = 00;
  int minuts = 00;
  int seconds = 00;
  WorldTime worldTime;
  Map data;

  void _timer(worldTime) {
    Future.delayed(Duration(seconds: 1)).then((_) {
      worldTime.addSecond();
      setState(() {
      time = worldTime.time; 
      hours = worldTime.hours;
      minuts = worldTime.minuts;
      seconds = worldTime.seconds;
      });
      _timer(worldTime);
    });
  }

@override
  void initState() {
    super.initState();
    WidgetsBinding.instance
    .addPostFrameCallback((_) => _timer(worldTime));
  }

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    worldTime = data['worldTime'];

    this.setState(() {
      time = worldTime.time; 
      hours = worldTime.hours;
      minuts = worldTime.minuts;
      seconds = worldTime.seconds;
    });

    return Scaffold(
      body : SafeArea(
                child: 
                Center(
                child: 
                Text('$hours:$minuts:$seconds',style: TextStyle(
                  fontSize: 80,
                ),)
                ,)
                ,));
  }
}