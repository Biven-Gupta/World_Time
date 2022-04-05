import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String? time = null;
  String flag;
  String url;
  bool? isDay = null;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Uri uri = Uri.parse("http://worldtimeapi.org/api/timezone/$url");
      Response res = await get(uri);
      Map data = jsonDecode(res.body);

      /*debugPrint('${res.statusCode}');
      debugPrint('is DateTime ${data['datetime'] is DateTime}');
      debugPrint('is DateTime ${data['datetime'].toString()}');*/
      String datetime = data['datetime'].toString();
      String offsetHour = data['utc_offset'].toString().substring(1, 3);
      String offsetMin = data['utc_offset'].toString().substring(4, 6);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(offsetHour), minutes: int.parse(offsetMin)));

      //To get Time
      isDay = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
      // Future.delayed(Duration(seconds: 3), () {
      //   print('qwerty');
      // });
    } catch (e) {
      time = 'Try Again';
    }
  }
}
