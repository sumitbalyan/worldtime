import 'package:flutter/material.dart';
import 'package:worldclock/model/worldclock.model.dart';
import 'package:worldclock/services/worldclock.service.dart';

class ChooseLocation extends StatefulWidget {
  ChooseLocation({Key key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  
  List<WorldClockModel> locations = [
    WorldClockModel(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldClockModel(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldClockModel(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldClockModel(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldClockModel(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldClockModel(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldClockModel(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldClockModel(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime (index) async {
    WorldClockModel wcmodel = locations[index];
    WorldClockService service = WorldClockService(model: wcmodel);
    await service.getTime();
    Navigator.pop(context, {
       'time': wcmodel.time,
      'location': wcmodel.location,
      'isDayTime' : wcmodel.isDayTime,
      'flag' : wcmodel.flag,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () => updateTime(index),
                title: Text(
                  locations[index].location,
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                )
              ),
            ),
          );
        }),
    );
  }
}