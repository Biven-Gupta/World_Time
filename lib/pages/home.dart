import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String location;
  final String time;
  final String flag;
  final bool isDay;

  const Home(
      {Key? key,
      required this.location,
      required this.flag,
      required this.time,
      required this.isDay})
      : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.location;
    widget.flag;
    widget.time;
    widget.isDay;
  }

  @override
  Widget build(BuildContext context) {
    String bgImage = widget.isDay ? 'assets/Day.png' : 'assets/night.png';
    return Scaffold(
      backgroundColor:
          widget.isDay ? const Color(0xfffbc758) : const Color(0xFF434BB1),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 80.0, 0, 0),
            child: Column(
              children: <Widget>[
                Text(
                  widget.time,
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
                    setState(() {
                      widget.isDay;
                      widget.time;
                      widget.location;
                      widget.flag;
                    });
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
                      backgroundColor: widget.isDay
                          ? const Color(0xFFFBA53B)
                          : const Color(0xFF635DC5),
                      child: Image.asset(
                        widget.flag,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Text(
                      widget.location,
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
