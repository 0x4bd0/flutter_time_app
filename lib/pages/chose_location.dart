import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_time_app/widgets/locationsList.dart';

class Chose_location extends StatefulWidget {
  @override
  _Chose_locationState createState() => _Chose_locationState();
}

class _Chose_locationState extends State<Chose_location> {
  List data = [];


  void getData () async{
    Response response = await get('http://worldtimeapi.org/api/timezone');
    setState(() {
      data = jsonDecode(response.body);
    });
    print(data);
  }

  @override
  void initState() { 
     super.initState();
      getData();
  }

  @override
  Widget build(BuildContext context) {

        
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[300],
        title: Text('Chose location'),
        elevation: 0,
      ),
      body :
       ListView(
         children: data.map((item) => 
         LocationsList(location: item,
         )
        ).toList(),
      ),
    );
  }
}