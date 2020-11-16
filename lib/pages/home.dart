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
  String location = '';
  String img = 'day.jpeg';

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
    location = data['location'];

    this.setState(() {
      time = worldTime.time; 
      hours = worldTime.hours;
      minuts = worldTime.minuts;
      seconds = worldTime.seconds;
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
                FloatingActionButton(onPressed: (){
                  Navigator.pushNamed(context, '/chose_location');
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