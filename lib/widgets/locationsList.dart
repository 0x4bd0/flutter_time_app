import 'package:flutter/material.dart';

class  LocationsList extends StatelessWidget {

  final location;

  LocationsList({this.location});

  @override
  Widget build(BuildContext context) {
    return  Container(
    child: 
    GestureDetector(
    onTap: () { 
    print('names jeff');
    },
    child: Card(
       child: 
       Padding(padding: EdgeInsets.all(15) ,child:Text(location)),
    ),
  )
    ,);

  }
}