import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {

  void getTime() async{

   Response response = await get('http://worldtimeapi.org/api/timezone/Africa/Algiers');

   Map data = jsonDecode(response.body);
   
   String hours_diff_str = data['utc_offset'].substring(1,3);
   int hours_diff = int.parse(hours_diff_str);

   DateTime now = DateTime.parse(data['datetime']);
   now.add(Duration(hours:hours_diff));

   print(now);

  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Text('Loading')
    );
  }
}