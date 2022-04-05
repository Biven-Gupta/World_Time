import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

import 'home.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> setupworldtime() async {
    WorldTime timeInstance = WorldTime(
        location: 'Kolkata', flag: 'assets/india.png', url: 'Asia/Kolkata');
    await timeInstance.getTime();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Home(
          location: timeInstance.location,
          flag: timeInstance.flag,
          time: timeInstance.time!,
          isDay: timeInstance.isDay!);
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupworldtime();
    //print('statement');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SafeArea(
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: 80.0,
          ),
        ),
      ),
    );
  }
}
