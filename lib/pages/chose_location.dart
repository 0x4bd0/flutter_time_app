import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Chose_location extends StatefulWidget {
  @override
  _Chose_locationState createState() => _Chose_locationState();
}

class _Chose_locationState extends State<Chose_location> {


  void getData () async{
    Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
    print( jsonDecode(response.body));
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
    );
  }
}