import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location;
  String time;
  String flag;
  String urlPath;
  int hours;
  int minuts;



  WorldTime({this.location,this.flag,this.urlPath});

  
  Future<void> getTime() async{

   Response response = await get('http://worldtimeapi.org/api/timezone/$location/$urlPath');

   Map data = jsonDecode(response.body);
   
   String hours_diff_str = data['utc_offset'].substring(1,3);
   int hours_diff = int.parse(hours_diff_str);

   DateTime now = DateTime.parse(data['datetime']);
   now.add(Duration(hours:hours_diff));


   time = now.toString();

   minuts = now.minute;
   hours = now.hour;


  }


}