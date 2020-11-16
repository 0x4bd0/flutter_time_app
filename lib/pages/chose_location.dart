import 'package:flutter/material.dart';

class Chose_location extends StatefulWidget {
  @override
  _Chose_locationState createState() => _Chose_locationState();
}

class _Chose_locationState extends State<Chose_location> {


  void getData () async{
     await Future.delayed(Duration(seconds: 3),(){
     print('skrrr');
    });
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