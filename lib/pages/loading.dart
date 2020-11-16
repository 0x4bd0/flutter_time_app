import 'package:flutter/material.dart';
import 'package:flutter_time_app/services/world_time.dart'; 

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {

  String location = 'Africa';
  String urlPath = 'Algiers';


  void setupWorldTime () async{
  WorldTime worldTime = WorldTime(location : location,flag:'algeria.png', urlPath: urlPath);
  
  await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
        'worldTime' : worldTime,
        'location' : location,
        'urlPath' : urlPath
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
      body : SafeArea(
      child: 
      Center(
      child: 
      Text('Loading ...',style: TextStyle(
        fontSize: 80,
      ),)
      ,)
      ,)
    );
  }
}
