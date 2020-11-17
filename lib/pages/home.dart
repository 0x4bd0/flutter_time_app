import 'package:flutter/material.dart';
import 'package:flutter_time_app/services/world_time.dart'; 

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String time = 'Loading ...';
  String hours = "00";
  String minuts = "00";
  String seconds = "00";
  WorldTime worldTime;
  Map data = {};
  String location = '';
  String img = 'day.jpeg';

  void _timer(worldTime) {
    Future.delayed(Duration(seconds: 1)).then((_) {
      worldTime.addSecond();
      this.setState(() {
      time = worldTime.time; 
      hours = worldTime.hours.toString().padLeft(2, '0');
      minuts = worldTime.minuts.toString().padLeft(2, '0');
      seconds = worldTime.seconds.toString().padLeft(2, '0');
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

    data = data.isNotEmpty ? data :ModalRoute.of(context).settings.arguments;

      worldTime = data['worldTime'];
      location = data['location'];


      this.setState(() {
        time = worldTime.time; 
        hours = worldTime.hours.toString().padLeft(2, '0');
        minuts = worldTime.minuts.toString().padLeft(2, '0');
        seconds = worldTime.seconds.toString().padLeft(2, '0');
      });

    img = worldTime.isDayTime ? 'day.jpeg' : 'night.jpg';

    return Scaffold(
      body : SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    image : DecorationImage(
                      image : AssetImage('assets/$img'),
                      fit : BoxFit.cover
                    )
                  ),
                child:                 
                Center(
                child: 
                Column(
                mainAxisAlignment : MainAxisAlignment.center,
                children: [       
                Text('$hours:$minuts:$seconds',style: TextStyle(fontSize: 80)),
                Text('$location',style: TextStyle(fontSize: 20)),  
                SizedBox(height:30),
                FloatingActionButton(onPressed: () async{
                  dynamic result = await Navigator.pushNamed(context, '/chose_location');
                    this.setState(() {
                      data = result;
                    });                 
                }, 
                child: 
                Icon(Icons.location_on, color: Colors.black),
                )      
                ]
                ,)
                ,)
                ,)
                ,)
                ,);
  }
}