import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldclock/model/worldclock.model.dart';
import 'package:worldclock/services/worldclock.service.dart';

class Loading extends StatefulWidget {
  Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time;
  void setupWorldTime() async {
    WorldClockModel wcmodel =
        WorldClockModel(flag: '', location: 'Paris', url: 'Europe/Paris');
    WorldClockService service = WorldClockService(model: wcmodel);
    await service.getTime();
    Navigator.pushNamed(context, '/home', arguments: {
      'time': wcmodel.time,
      'location': wcmodel.location,
      'isDayTime' : wcmodel.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext contrext) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          body: SpinKitFoldingCube(
            color: Colors.white,
            size: 80.0,
          ),
          backgroundColor: Colors.blue[900],
        ),
      ),
    );
  }
}
