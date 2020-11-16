import 'package:flutter/material.dart';
import 'package:flutter_time_app/pages/home.dart';
import 'package:flutter_time_app/pages/loading.dart';
import 'package:flutter_time_app/pages/chose_location.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute : '/',
      routes : {
        '/' : (context) => Loading(),
        '/home' : (context) => Home(),
        '/chose_location' : (context) => Chose_location()
      }
    )
  );
}
