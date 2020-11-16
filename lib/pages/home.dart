import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SafeArea( 
        child : Center(
          child: Column(
            children: [
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/chose_location');
                }, 
                icon: Icon(Icons.location_on),
                label :  Text('Chose location')
                )
            ],
            )
        ,)
      )
    );
  }
}