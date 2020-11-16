import 'package:flutter/material.dart';
import 'package:flutter_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {

  String time = 'Loading ...';
  int hours = 00;
  int minuts = 00;


  void setupWorldTime () async{
  WorldTime worldTime = WorldTime(location : 'Africa',flag:'algeria.png', urlPath: 'Algiers');
  await worldTime.getTime();
      this.setState(() {
      time = worldTime.time; 
      hours = worldTime.hours;
      minuts = worldTime.minuts;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SafeArea(child: 
      Center(child: 
      Text('$hours:$minuts',style: TextStyle(
        fontSize: 150
      ),)
      ,)
      ,)
    );
  }
}
