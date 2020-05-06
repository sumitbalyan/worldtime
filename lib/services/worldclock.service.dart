import 'dart:convert';

import 'package:worldclock/model/worldclock.model.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:worldclock/constants/service.constants.dart';

class WorldClockService {
  WorldClockModel model;
  WorldClockService({this.model});

  Future<void> getTime() async {
    try {
      Response response =
          await get('$BASEURL/${model.url}');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].toString().substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      model.isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      model.time = DateFormat.jm().format(now);
    } catch (e) {
      this.model.time = 'could not get time data.';
    }
  }

}
