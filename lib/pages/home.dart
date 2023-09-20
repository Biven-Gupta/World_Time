import 'package:flutter/material.dart';
import 'package:world_time/main.dart';
import 'package:world_time/model/model.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with RouteAware {
  ModelClass model = ModelClass();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          model.isDay ? const Color(0xfffbc758) : const Color(0xFF434BB1),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  model.isDay ? 'assets/Day.png' : 'assets/night.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 80.0, 0, 0),
            child: Column(
              children: <Widget>[
                Text(
                  model.time,
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 20.0),
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    //Location();
                  },
                  label: Text(
                    'Choose Location',
                    style: TextStyle(
                      color: Colors.grey[200],
                    ),
                  ),
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.red[900],
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: model.isDay
                          ? const Color(0xFFFBA53B)
                          : const Color(0xFF635DC5),
                      child: Image.asset(model.flag),
                    ),
                    const SizedBox(width: 20.0),
                    Text(
                      model.location,
                      style: TextStyle(
                        fontSize: 32.0,
                        letterSpacing: 2.0,
                        color: Colors.grey[200],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
