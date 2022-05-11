import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/model/model.dart';
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
    ModelClass model = ModelClass();
    model.isDay = timeInstance.isDay!;
    model.location = timeInstance.location;
    model.flag = timeInstance.flag;
    model.time = timeInstance.time!;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const Home();
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () => setupworldtime());

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
