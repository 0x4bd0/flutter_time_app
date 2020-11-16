import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location;
  String time;
  String flag;
  DateTime original;
  int hours;
  int minuts;
  int seconds;
  bool isDayTime;
  Map data;



  WorldTime({this.location,this.flag});

  
    Future<void> addSecond() async{

          original = original.add(Duration(seconds: 1));

          time = original.toString();

          minuts = original.minute;
          hours = original.hour;
          seconds = original.second;

          isDayTime = hours > 6 && hours < 20 ? true : false;
      
    }

  Future<void> getTime() async{

    try {

   Response response;

    if(location != null){
      response = await get('http://worldtimeapi.org/api/timezone/$location');
       data = jsonDecode(response.body);
    } else {
      response = await get('http://worldtimeapi.org/api/ip');
       data = jsonDecode(response.body);
      location = data['timezone'];
    }

   
   String hoursDiffStr = data['utc_offset'].substring(1,3);
   int hoursDiff = int.parse(hoursDiffStr);

   DateTime now = DateTime.parse(data['datetime']);
   now.add(Duration(hours:hoursDiff));
   
   original = now;

   time = now.toString();

   minuts = now.minute;
   hours = now.hour;
   seconds = now.second;
   
   isDayTime = hours > 6 && hours < 20 ? true : false;

    }
    catch(err) {

      time = 'Oups, something went wrong';

    }





  }


}