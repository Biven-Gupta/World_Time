import 'package:flutter/material.dart';
import 'package:world_time/model/model.dart';
import 'package:world_time/services/world_time.dart';

import 'home.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'assets/uk.png'),
    WorldTime(
        url: 'Europe/Berlin', location: 'Athens', flag: 'assets/greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'assets/egypt.png'),
    WorldTime(
        url: 'Africa/Nairobi', location: 'Nairobi', flag: 'assets/kenya.png'),
    WorldTime(
        url: 'America/Chicago', location: 'Chicago', flag: 'assets/usa.png'),
    WorldTime(
        url: 'America/New_York', location: 'New York', flag: 'assets/usa.png'),
    WorldTime(
        url: 'Asia/Seoul', location: 'Seoul', flag: 'assets/south_korea.png'),
    WorldTime(
        url: 'Asia/Kolkata', location: 'Kolkata', flag: 'assets/india.png'),
    WorldTime(
        url: 'Asia/Jakarta', location: 'Jakarta', flag: 'assets/indonesia.png'),
  ];
  void updateTime(index) async {
    WorldTime timeInstance = locations[index];
    await timeInstance.getTime();
    ModelClass model = ModelClass();
    model.isDay = timeInstance.isDay!;
    model.location = timeInstance.location;
    model.flag = timeInstance.flag;
    model.time = timeInstance.time!;
    Navigator.pop(context, MaterialPageRoute(builder: (context) {
      return const Home();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(locations[index].flag),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
