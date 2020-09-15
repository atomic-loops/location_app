import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _locationMessage = "";

  void _getCurrentLocation() async {
    var position = await getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    setState(() {
      _locationMessage =
          "Latitude is: ${position.latitude}\nLongitude is: ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[50],
        appBar: AppBar(
          title: Text(
            "Get Your Location",
            style: TextStyle(color: Colors.tealAccent),
          ),
          backgroundColor: Colors.teal[400],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                _locationMessage,
                style: TextStyle(
                    color: Colors.teal[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                _getCurrentLocation();
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        color: Color(0x808080).withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 2)
                  ],
                ),
                child: Center(
                  child: Text(
                    "Get Location",
                    style: TextStyle(
                        color: Colors.tealAccent,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
